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
            // 点击窗口的关闭按钮，默认不会隐藏Dock栏图标
            // 隐藏的话需要在Info.plist中设置Application is agent (UIElement)为YES
            // 但这种方式一旦设置，运行后Dock栏不会出现图标
            ContentView()
        }
    }
}
