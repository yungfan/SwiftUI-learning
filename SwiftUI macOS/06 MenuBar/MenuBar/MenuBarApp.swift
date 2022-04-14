//
//  MenuBarApp.swift
//  MenuBar
//
//  Created by 杨帆 on 2022/4/14.
//

import SwiftUI

@main
struct MenuBarApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        WindowGroup {
            EmptyView()
                .frame(width: .zero)
        }

        WindowGroup("myScene") {
            ContentView()
        }
        .handlesExternalEvents(matching: ["myScene"])
    }
}
