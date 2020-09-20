//
//  _UIApplicationDelegateAdaptorApp.swift
//  @UIApplicationDelegateAdaptor
//
//  Created by 杨帆 on 2020/9/19.
//

import SwiftUI

@main
struct _UIApplicationDelegateAdaptorApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegte
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
