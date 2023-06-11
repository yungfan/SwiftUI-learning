//
//  SwiftDataTestApp.swift
//  SwiftDataTest
//
//  Created by 杨帆 on 2023/6/6.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataTestApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
        .modelContainer(for: [User.self, Company.self])
    }
}
