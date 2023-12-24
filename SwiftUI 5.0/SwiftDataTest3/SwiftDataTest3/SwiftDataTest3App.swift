//
//  SwiftDataTest3App.swift
//  SwiftDataTest3
//
//  Created by 杨帆 on 2023/12/24.
//

import SwiftUI

// 3
// MARK: - 默认数据存储方式
@main
struct SwiftDataTest3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Contact.self)
    }
}
