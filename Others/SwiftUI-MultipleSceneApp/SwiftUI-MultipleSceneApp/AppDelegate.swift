//
//  AppDelegate.swift
//  SwiftUI-MultipleSceneApp
//
//  Created by 杨帆 on 2021/4/8.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        if let userActivity = options.userActivities.first, userActivity.activityType == targetContentIdentifier {
            let sceneTwoConfiguration = UISceneConfiguration(name: "SceneTwo", sessionRole: connectingSceneSession.role)
            sceneTwoConfiguration.delegateClass = SecondSceneDelegate.self
            return sceneTwoConfiguration
        }

        return UISceneConfiguration(name: "MainScene", sessionRole: connectingSceneSession.role)
    }
}
