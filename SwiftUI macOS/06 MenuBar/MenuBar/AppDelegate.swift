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
    private var menuExtrasConfigurator: MacExtrasConfigurator?

    func applicationDidFinishLaunching(_ notification: Notification) {
        menuExtrasConfigurator = .init()
    }
}

private final class MacExtrasConfigurator: NSObject {
    @Environment(\.openURL) var openURL
    private var statusItem: NSStatusItem

    override init() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        super.init()
        createMenu()
    }

    private func createMenu() {
        if let statusBarButton = statusItem.button {
            statusBarButton.image = NSImage(
                systemSymbolName: "hammer",
                accessibilityDescription: nil
            )

            let mainMenu = NSMenu()

            // 第一个菜单，打开窗口
            let first = NSMenuItem(title: "Open", action: #selector(openClicked), keyEquivalent: "o")
            first.target = self
            mainMenu.addItem(first)

            // 第二个菜单，关闭App
            let second = NSMenuItem(title: "Quit", action: #selector(quitClicked), keyEquivalent: "q")
            second.target = self
            mainMenu.addItem(second)
            // 设置菜单
            statusItem.menu = mainMenu
        }
    }

    // 打开另外一个窗口
    @objc private func openClicked(_ sender: Any?) {
        openURL(URL(string: "MenuBar://myScene")!)
    }

    // 退出App
    @objc private func quitClicked(_ sender: Any?) {
        // NSApp.terminate(self)
        NSApplication.shared.terminate(nil)
    }
}
