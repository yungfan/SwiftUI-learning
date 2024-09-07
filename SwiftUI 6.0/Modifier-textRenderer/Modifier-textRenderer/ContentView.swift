//
//  ContentView.swift
//  Modifier-textRenderer
//
//  Created by 杨帆 on 2024/9/7.
//

import SwiftUI

// MARK: - 自定义TextRendrer
struct CustomTextRenderer: TextRenderer {
    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for (index, line) in layout.enumerated() {
            if index.isMultiple(of: 2) { // 偶数行
                context.opacity = 1.0
            } else {
                context.opacity = 0.2 // 奇数行
            }
            context.draw(line)
        }
    }
}

struct ContentView: View {
    var body: some View {
        Text("WWDC24 Swift 6.0 \nWWDC24 Swift 6.0")
            .font(.largeTitle)
            .textRenderer(CustomTextRenderer())
    }
}


#Preview {
    ContentView()
}
