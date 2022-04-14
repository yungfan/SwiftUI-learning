//
//  WindowGroupApp.swift
//  WindowGroup
//
//  Created by 杨帆 on 2022/4/14.
//

import SwiftUI

@main
struct WindowGroupApp: App {
    var body: some Scene {
        // 默认可以多窗口
        WindowGroup("窗口1") {
            ContentView()
                .onAppear {
                    NSWindow.allowsAutomaticWindowTabbing = false // 禁用菜单 Show Tab Bar
                }
        }
        .commands {
            CommandGroup(replacing: .newItem, addition: { }) // 替换掉新建菜单
        }
    }
}
