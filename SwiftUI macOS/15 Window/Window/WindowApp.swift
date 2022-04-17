//
//  WindowApp.swift
//  Window
//
//  Created by 杨帆 on 2022/4/17.
//

import SwiftUI

@main
struct WindowApp: App {
    @State var condition = false

    var body: some Scene {
        WindowGroup {
            if condition {
                ContentView()
            } else {
                WelcomeView()
            }
        }
        .windowStyle(.hiddenTitleBar)
        // .windowToolbarStyle(.unified(showsTitle: false))
    }
}
