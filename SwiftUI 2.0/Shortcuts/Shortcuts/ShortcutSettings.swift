//
//  ShortcutSettings.swift
//  Shortcuts
//
//  Created by 杨帆 on 2021/3/27.
//

import UIKit

enum ShortcutType: String {
    case scan, favorite
}

class ShortcutSettings: ObservableObject {
    @Published var shortcutType: ShortcutType?

    init(initialValue: ShortcutType? = nil) {
        print(#function)
        shortcutType = initialValue
    }
}
