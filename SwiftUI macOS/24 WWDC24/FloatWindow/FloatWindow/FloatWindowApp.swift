//
//  FloatWindowApp.swift
//  FloatWindow
//
//  Created by 杨帆 on 2025/1/11.
//

import SwiftUI

@main
struct FloatWindowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WindowGroup(id: "FloatWindow") {
            FloatWindow()
                .simultaneousGesture(WindowDragGesture())
                .toolbarVisibility(.hidden, for: .windowToolbar)
                .containerBackground(.clear, for: .window)
        }
        .windowLevel(.floating) // macOS 15
        .windowResizability(.contentSize)
        .windowStyle(.plain)
    }
}
