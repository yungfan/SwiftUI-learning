//
//  iCloud_DocumentsApp.swift
//  iCloud-Documents
//
//  Created by 杨帆 on 2021/12/29.
//

import SwiftUI

@main
struct iCloud_DocumentsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                NavigationLink(
                    "iCloud Documents",
                    destination: ContentView()
                        .navigationTitle("Content")
                )
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("iCloud Documents")
            }
        }
    }
}
