//
//  ContentView.swift
//  MQTTClient
//
//  Created by 杨帆 on 2023/10/14.
//

import CocoaMQTT
import SwiftUI

struct ContentView: View {
    let mqttClient = CocoaMQTT(clientID: "swift", host: "broker.emqx.io", port: 1883)
    @State private var connection = false
    @State private var sendMessage = ""
    @State private var receiveMessages = [String]()

    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 30) {
                Button("Connect") {
                    mqttClient.username = ""
                    mqttClient.password = ""
                    mqttClient.willMessage = CocoaMQTTMessage(topic: "/will", string: "dieout")
                    mqttClient.keepAlive = 60
                    mqttClient.allowUntrustCACertificate = true
                    connection = mqttClient.connect()
                    mqttClient.autoReconnect = true
                }
                .disabled(connection)

                Button("Disconnect") {
                    mqttClient.unsubscribe("topic/swiftui")
                    mqttClient.disconnect()
                    connection = false
                }
                .disabled(!connection)
            }

            TextField("请输入发送内容", text: $sendMessage)
                .textFieldStyle(.roundedBorder)

            HStack(spacing: 30) {
                Button("Subscribe") {
                    mqttClient.subscribe("topic/swiftui")
                    mqttClient.didReceiveMessage = { _, message, _ in
                        print("Message received in topic \(message.topic) with payload \(message.string!)")
                        receiveMessages.insert("\(message.topic): \(message.string!)", at: 0)
                    }
                }

                Button("Publish") {
                    mqttClient.publish("topic/ios", withString: sendMessage)
                }

                Button("Clear") {
                    receiveMessages.removeAll()
                }
            }
            .disabled(!connection)

            ScrollView {
                ForEach(receiveMessages, id: \.self) { receiveMessage in
                    HStack {
                        Text(Date.now.formatted(.dateTime.year().month().day().hour().minute().second().locale(Locale(identifier: "zh_Hans_CN")))) +
                            Text(receiveMessage)
                            .foregroundStyle(.red)

                        Spacer()
                    }
                    .padding(2)
                }

                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
