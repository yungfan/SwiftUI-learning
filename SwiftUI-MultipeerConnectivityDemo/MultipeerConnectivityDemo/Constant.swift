//
//  Constant.swift
//  ConnectedColors
//
//  Created by 杨帆 on 2021/12/5.
//

import MultipeerConnectivity
import SwiftUI

enum NamedColor: String, CaseIterable {
    case red, green, orange, purple
}

extension NamedColor {
    var color: Color {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .orange:
            return .orange
        case .purple:
            return .purple
        }
    }
}

