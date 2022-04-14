//
//  SecondSceneDelegate.swift
//  SwiftUI-MultipleSceneApp
//
//  Created by 杨帆 on 2021/4/8.
//

import SwiftUI
import UIKit

class SecondSceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError("Expected a UIWindowScene")
        }

        let contentView = SecondContentView().environment(\.sceneSession, session)
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView)
        window.makeKeyAndVisible()
        self.window = window
    }
}
