//
//  MenuBarExtraAppApp.swift
//  MenuBarExtraApp
//
//  Created by 杨帆 on 2022/6/8.
//

import SwiftUI

@main
struct MenuBarExtraAppApp: App {
    var body: some Scene {
        // 状态栏App，需要macOS 13+
        MenuBarExtra("状态栏App", systemImage: "hammer") {
            // 点击状态栏显示的内容
            ContentView()
        }
    }
}
