//
//  ContentView.swift
//  LaunchAtLogin
//
//  Created by 杨帆 on 2025/3/13.
//

import ServiceManagement
import SwiftUI

struct ContentView: View {
    @State private var launchAtLogin = false

    var body: some View {
        // 设置开机启动
        Toggle("Launch at login", isOn: $launchAtLogin)
            .font(.title)
            .onChange(of: launchAtLogin) { _, newValue in
                if newValue == true {
                    try? SMAppService.mainApp.register() // 弹出通知
                } else {
                    try? SMAppService.mainApp.unregister()
                }
            }
            .onAppear {
                if SMAppService.mainApp.status == .enabled { // 检查是否开机启动
                    print("Launch at login")
                    launchAtLogin = true
                } else {
                    print("Not launch at login")
                    launchAtLogin = false
                }
            }
    }
}

#Preview {
    ContentView()
}
