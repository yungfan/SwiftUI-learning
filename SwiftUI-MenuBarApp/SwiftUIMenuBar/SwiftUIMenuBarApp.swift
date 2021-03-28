//
//  SwiftUIMenuBarApp.swift
//  SwiftUIMenuBar
//
//  Created by 杨帆 on 2021/3/28.
//

import SwiftUI

@main
struct SwiftUIMenuBarApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            // 1. 隐藏主窗口：frame为0
            // 2. 隐藏状态栏：Application is agent (UIElement)为YES
            ContentView()
                .frame(width: 0, height: 0, alignment: .center)
        }
    }
}
