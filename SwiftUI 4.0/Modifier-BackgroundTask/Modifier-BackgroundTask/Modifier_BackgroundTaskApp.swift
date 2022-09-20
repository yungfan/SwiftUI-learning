//
//  Modifier_BackgroundTaskApp.swift
//  Modifier-BackgroundTask
//
//  Created by 杨帆 on 2022/9/18.
//

import SwiftUI
import BackgroundTasks

@main
struct Modifier_BackgroundTaskApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { newValue in
            if newValue == .background {
                
            }
        }
//        .backgroundTask(.appRefresh("com.test.swiftui4")) { _ in
//
//        }
    }
    
    func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.test.swiftui4")
        request.earliestBeginDate = .now + 10
        do {
            try BGTaskScheduler.shared.submit(request)
        }
        catch {
            print(error)
        }
    }
}
