//
//  MultiplatformApp.swift
//  Shared
//
//  Created by 杨帆 on 2021/3/20.
//

import SwiftUI

@main
struct MultiplatformApp: App {
    var body: some Scene {
        WindowGroup {
            PlatFormView()
        }
//            .windowToolbarStyle(UnifiedWindowToolbarStyle(showsTitle: false)) // 隐藏mac上的标题
//            .commands {
//                SidebarCommands() // mac的View菜单能够切换sideBar
//            }
    }
}
