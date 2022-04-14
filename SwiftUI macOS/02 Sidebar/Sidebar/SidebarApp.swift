//
//  SidebarApp.swift
//  Sidebar
//
//  Created by 杨帆 on 2022/4/14.
//

import SwiftUI

@main
struct SidebarApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands() // 菜单中打开/关闭Siderbar
        }
    }
}
