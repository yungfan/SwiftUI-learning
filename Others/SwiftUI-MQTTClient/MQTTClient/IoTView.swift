//
//  IoTView.swift
//  MQTTClient
//
//  Created by 杨帆 on 2023/10/15.
//

import CocoaMQTT
import SwiftUI

struct IoT: Codable {
    var lightOn: Bool
    var weather: String
    var temperature: Int
    var wet: Int
    var wind: Int
}

struct VLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
        }
    }
}

struct IoTView: View {
    @State private var connection = false
    let mqttClient = CocoaMQTT(clientID: "iot", host: "10.213.1.117", port: 1883)
    @State private var iot: IoT?

    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Label {
                    Text(iot?.weather ?? "晴天")
                } icon: {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                }
                .labelStyle(VLabelStyle())

                Spacer()

                Label {
                    Text("\(iot?.temperature ?? 0)℃")
                } icon: {
                    Image(systemName: "thermometer.sun.fill")
                        .renderingMode(.original)
                }
                .labelStyle(VLabelStyle())

                Spacer()

                Label {
                    Text("\(iot?.wet ?? 0)%")
                } icon: {
                    Image(systemName: "thermometer")
                        .renderingMode(.original)
                }
                .labelStyle(VLabelStyle())

                Spacer()

                Label {
                    Text("\(iot?.wind ?? 0)m/s")
                } icon: {
                    Image(systemName: "wind")
                        .renderingMode(.original)
                }
                .labelStyle(VLabelStyle())
            }
            .redacted(reason: iot == nil ? .placeholder : [])
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(iot?.lightOn ?? false ? Color.blue : Color.black))

            Spacer()
        }
        .padding()
        .task {
            mqttClient.username = "123"
            mqttClient.password = "123"
            mqttClient.willMessage = CocoaMQTTMessage(topic: "/will", string: "dieout")
            mqttClient.keepAlive = 60
            mqttClient.allowUntrustCACertificate = true
            connection = mqttClient.connect()
            mqttClient.autoReconnect = true

            try? await Task.sleep(until: .now + .seconds(1), clock: .continuous)

            mqttClient.subscribe("topic/iot")
            mqttClient.didReceiveMessage = { _, message, _ in
                print(message)
                if let message = message.string {
                    do {
                        iot = try JSONDecoder().decode(IoT.self, from: message.data(using: .utf8)!)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }

            print(connection)
        }
    }
}

#Preview {
    IoTView()
}

// {
//  "wet": 77,
//  "wind": 4,
//  "temperature": 27,
//  "lightOn": false,
//  "weather": "晴天"
// }
//
// {
//  "wet": 66,
//  "wind": 3,
//  "temperature": 26,
//  "lightOn": true,
//  "weather": "小雨"
// }
