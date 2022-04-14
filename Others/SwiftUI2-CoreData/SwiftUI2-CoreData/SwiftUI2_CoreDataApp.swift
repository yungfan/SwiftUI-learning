//
//  SwiftUI2_CoreDataApp.swift
//  SwiftUI2-CoreData
//
//  Created by 杨帆 on 2021/4/3.
//

import SwiftUI

@main
struct SwiftUI2_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
