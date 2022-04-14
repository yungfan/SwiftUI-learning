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
    // 添加Dock菜单
    func applicationDockMenu(_ sender: NSApplication) -> NSMenu? {
        print(#function)
        let mainMenu = NSMenu()

        // 第一个菜单
        let first = NSMenuItem(title: "Menu1", action: #selector(menu1Clicked), keyEquivalent: "1")
        first.target = self
        mainMenu.addItem(first)

        // 第二个菜单
        let second = NSMenuItem(title: "Menu2", action: #selector(menu2Clicked), keyEquivalent: "2")
        second.target = self
        mainMenu.addItem(second)

        return mainMenu
    }

    @objc private func menu1Clicked(_ sender: Any?) {
        print(#function)
    }

    @objc private func menu2Clicked(_ sender: Any?) {
        print(#function)
    }
}
