//
//  PreferencesApp.swift
//  Preferences
//
//  Created by 杨帆 on 2022/4/14.
//

import SwiftUI

@main
struct PreferencesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        // 偏好设置
        Settings {
            SettingsView()
        }
    }
}
