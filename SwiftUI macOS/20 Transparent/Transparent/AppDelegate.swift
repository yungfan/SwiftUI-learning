//
//  AppDelegate.swift
//  MenuBar
//
//  Created by 杨帆 on 2022/4/14.
//

import AppKit
import Foundation
import SwiftUI

final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
    }

    // 关闭最后一个窗口时关闭App
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    // 点击Dock栏重新打开App（目前有bug，不会调用）
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        print(#function)
        return true
    }
}
