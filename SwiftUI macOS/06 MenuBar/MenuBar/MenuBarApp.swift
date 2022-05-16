//
//  MenuBarApp.swift
//  MenuBar
//
//  Created by 杨帆 on 2022/4/14.
//

import SwiftUI

@main
struct MenuBarApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        // 默认主窗口
        WindowGroup {
            ContentView()
            // .frame(width: .zero)
        }

        // 点击菜单栏打开一个新窗口
        WindowGroup("myScene") {
            MenuView()
        }
        .handlesExternalEvents(matching: ["myScene"])
    }
}
