//
//  BlurWindowApp.swift
//  BlurWindow
//
//  Created by 杨帆 on 2024/6/20.
//

import SwiftUI

@main
struct BlurWindowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .toolbar(removing: .title) // macOS 15+
                .toolbarBackgroundVisibility(.hidden, for: .windowToolbar) // macOS 15+
                .containerBackground(.thinMaterial, for: .window) // macOS 15+
        }
        .windowResizability(.contentSize)
    }
}
