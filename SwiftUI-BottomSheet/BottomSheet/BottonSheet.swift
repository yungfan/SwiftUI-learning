//
//  ButtonSheet.swift
//  BottomSheet
//
//  Created by 杨帆 on 2021/8/11.
//

import SwiftUI

enum SheetMode {
    case none
    case quarter
    case half
    case threeQuarter
    case full
}

struct BottonSheet<Content: View>: View {
    let content: () -> Content
    var sheetMode: Binding<SheetMode>

    init(sheetMode: Binding<SheetMode>, @ViewBuilder content: @escaping () -> Content) {
        self.sheetMode = sheetMode
        self.content = content
    }

    private func calculateOffset() -> CGFloat {
        switch sheetMode.wrappedValue {
        case .none:
            return UIScreen.main.bounds.height
        case .quarter:
            return UIScreen.main.bounds.height * 0.75
        case .half:
            return UIScreen.main.bounds.height * 0.5
        case .threeQuarter:
            return UIScreen.main.bounds.height * 0.25
        case .full:
            return 0
        }
    }

    var body: some View {
        content()
            .offset(y: calculateOffset())
            .animation(.spring())
            .ignoresSafeArea()
    }
}
