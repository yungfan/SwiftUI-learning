//
//  NoteAppApp.swift
//  NoteApp
//
//  Created by 杨帆 on 2023/10/25.
//

import SwiftUI

@main
struct NoteAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .frame(minWidth: 320, minHeight: 400)
        }
        .windowResizability(.contentSize)
        .modelContainer(for: [Note.self, NoteCategory.self])
    }
}
