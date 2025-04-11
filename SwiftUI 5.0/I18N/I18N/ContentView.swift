//
//  ContentView.swift
//  I18N
//
//  Created by 杨帆 on 2025/4/11.
//

import SwiftUI

struct ContentView: View {
    let temperature = 10

    var body: some View {
        VStack {
            // 纯文本
            Text(String(localized: "title", defaultValue: "Kindly Reminder"))

            // 自定义View
            MessageView(String(localized: "message", defaultValue: "Weather Information"))

            // 插值
            Text(String(localized: "weather",
                        defaultValue: "Weather is \(String(localized: "localizedWeather", defaultValue: "Sunny"))"))

            Text(String(localized: "temperature",
                        defaultValue: "Temperature is \(temperature) ℃"))
        }
        .padding()
    }
}

struct MessageView: View {
    let message: String

    init(_ message: String) {
        self.message = message
    }

    var body: some View {
        Text(message)
    }
}


#Preview {
    ContentView()
}

