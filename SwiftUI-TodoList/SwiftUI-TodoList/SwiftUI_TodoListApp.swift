//
//  SwiftUI_TodoListApp.swift
//  SwiftUI-TodoList
//
//  Created by 杨帆 on 2021/4/6.
//

import SwiftUI

@main
struct SwiftUI_TodoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
