//
//  MenuApp.swift
//  Menu
//
//  Created by 杨帆 on 2022/4/14.
//

import SwiftUI

@main
struct MenuApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            Menus() // 设置菜单
        }
    }
}
