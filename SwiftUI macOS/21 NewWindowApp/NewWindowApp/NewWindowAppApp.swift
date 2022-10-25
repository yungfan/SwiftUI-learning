//
//  NewWindowAppApp.swift
//  NewWindowApp
//
//  Created by 杨帆 on 2022/6/17.
//

import SwiftUI

@main
struct NewWindowApp: App {
    var body: some Scene {
        WindowGroup("Main View") {
            ContentView()
        }

        Window("New window", id: "new_window") {
            Text("New window")
        }
        .keyboardShortcut("0") // command+0快速打开

        WindowGroup(id: "new_windowgroup") {
            Text("New window group")
        }
        .keyboardShortcut("1")
        .defaultPosition(.center) // 显示的位置
        .defaultSize(width: 400, height: 450) // 显示的尺寸
    }
}
