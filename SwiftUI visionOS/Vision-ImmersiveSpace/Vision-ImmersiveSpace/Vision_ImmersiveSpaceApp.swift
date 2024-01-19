//
//  Vision_ImmersiveSpaceApp.swift
//  Vision-ImmersiveSpace
//
//  Created by 杨帆 on 2024/1/19.
//

import SwiftUI

@main
struct Vision_ImmersiveSpaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
