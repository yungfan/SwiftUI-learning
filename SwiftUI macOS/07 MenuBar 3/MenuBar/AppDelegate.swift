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

        // 窗口居中
        NSApp.windows.first?.center()
        // 一开始运行时Dock栏显示图标，通过手动方式显隐Dock栏图标，需要3步
        // 1. 设置代理
        NSApp.windows.first?.delegate = self
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

    @objc private func openClicked(_ sender: Any?) {
        // 3. 显示Dock栏的图标和窗口
        NSApplication.shared.setActivationPolicy(.regular)
        NSApp.windows.first?.center()
        // 窗口置于最前
        NSApp.activate(ignoringOtherApps: true)
    }

    @objc private func quitClicked(_ sender: Any?) {
        // NSApp.terminate(self)
        NSApplication.shared.terminate(nil)
    }
}

extension AppDelegate: NSWindowDelegate {
    // MARK: 点击窗口左上角的关闭按钮
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        print(#function)
        // 2. 隐藏Dock栏的图标和窗口
        NSApplication.shared.setActivationPolicy(.accessory)
        NSApp.hide(nil)
        return false
    }
}
