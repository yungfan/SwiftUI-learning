//
//  TransparentApp.swift
//  Transparent
//
//  Created by 杨帆 on 2022/4/20.
//

import SwiftUI

@main
struct TransparentApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)
        .windowToolbarStyle(.unified)
        .handlesExternalEvents(matching: ["*"])
    }
}
