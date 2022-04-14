//
//  DockerMenuApp.swift
//  DockerMenu
//
//  Created by 杨帆 on 2022/4/14.
//

import SwiftUI

@main
struct DockerMenuApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
