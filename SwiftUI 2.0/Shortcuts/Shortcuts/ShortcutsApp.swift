//
//  ShortcutsApp.swift
//  Shortcuts
//
//  Created by 杨帆 on 2021/3/27.
//

import SwiftUI

@main
struct ShortcutsApp: App {
    @Environment(\.scenePhase) private var scenePhase

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    private let shortcutSettings = ShortcutSettings()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(shortcutSettings) // 将ShortcutSettings存储并传递
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                print("active")
                guard let shortcutItem = AppDelegate.shortcutItem else { return }
                // 获取用户点击的菜单类型并赋值给ObservableObject
                shortcutSettings.shortcutType = ShortcutType(rawValue: shortcutItem.type)
            case .inactive:
                print("inactive")
            case .background:
                print("background")
                // App进入后台后添加菜单
                addDynamicShortcuts()
            @unknown default:
                print("default")
            }
        }
    }
}

extension ShortcutsApp {
    private func addDynamicShortcuts() {
        // 添加快捷菜单
        UIApplication.shared.shortcutItems = [
            // 第一个菜单
            UIApplicationShortcutItem(
                type: ShortcutType.scan.rawValue, // 类型
                localizedTitle: "扫一扫", // 标题
                localizedSubtitle: "扫内容", // 副标题
                icon: UIApplicationShortcutIcon(systemImageName: "qrcode.viewfinder"), // 图标
                userInfo: nil // 参数
            ),
            // 第二个菜单
            UIApplicationShortcutItem(
                type: ShortcutType.favorite.rawValue,
                localizedTitle: "收藏",
                localizedSubtitle: "收藏内容",
                icon: UIApplicationShortcutIcon(type: .favorite),
                userInfo: nil
            )
        ]
    }
}
