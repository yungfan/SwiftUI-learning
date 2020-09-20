//
//  _8_ModifierApp.swift
//  08 Modifier
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI

@main
struct _8_ModifierApp: App {
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                // App became active
                print("active")
            case .inactive:
                // App became inactive
                print("inactive")
            case .background:
                // App is running in the background
                print("background")
                       @unknown default:
                // Fallback for future cases
                print("default")
            }
        }
    }
}
