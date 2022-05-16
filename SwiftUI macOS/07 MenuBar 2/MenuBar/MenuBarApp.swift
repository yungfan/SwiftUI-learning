//
//  MenuBarApp.swift
//  MenuBar
//
//  Created by 杨帆 on 2022/4/14.
//

import SwiftUI

@main
struct SwiftUIMenuBarApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            // 1. 隐藏主窗口：frame为0，但Dock栏图标还在
            // 2. 隐藏Dock栏：Application is agent (UIElement)为YES（运行直接隐藏）
            ContentView()
                .frame(width: 100, height: 100, alignment: .center)
        }
    }
}
