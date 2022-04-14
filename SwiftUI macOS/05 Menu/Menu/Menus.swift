//
//  Menus.swift
//  Menu
//
//  Created by 杨帆 on 2022/4/14.
//

import SwiftUI

struct Menus: Commands {
    var body: some Commands {
        // 系统菜单
        SidebarCommands()
        ToolbarCommands()

        // 追加菜单到已存在的菜单
        CommandGroup(before: .help) {
            Button("插入菜单项") {
                print("插入菜单项")
            }
        }

        CommandGroup(after: .appInfo) {
            Button("插入菜单项") {
                print("插入菜单项")
            }
        }

        // 创建新的菜单
        CommandMenu("顶级菜单") {
            Button("菜单项1") {
                print("菜单项1")
            }

            Button("菜单项2") {
                print("菜单项2")
            }
        }
    }
}
