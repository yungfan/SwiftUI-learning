//
//  AppDelegate.swift
//  SwiftUI2Learning
//
//  Created by 杨帆 on 2020/6/25.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    // 用户操作的菜单
    static var shortcutItem: UIApplicationShortcutItem?

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        if let shortcutItem = options.shortcutItem {
            AppDelegate.shortcutItem = shortcutItem
        }
        let sceneConfiguration = UISceneConfiguration(name: "Scene Configuration", sessionRole: connectingSceneSession.role)
        // 设置代理
        sceneConfiguration.delegateClass = SceneDelegate.self

        return sceneConfiguration
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        // 将用户点击的shortcutItem赋值给AppDelegate.shortcutItem
        AppDelegate.shortcutItem = shortcutItem
        completionHandler(true)
        print(#function)
    }
}
