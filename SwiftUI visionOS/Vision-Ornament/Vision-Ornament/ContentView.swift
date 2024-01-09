//
//  ContentView.swift
//  Vision-Ornament
//
//  Created by 杨帆 on 2024/1/9.
//

import RealityKit
import RealityKitContent
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("A view with an ornament")
            .font(.title)
            .ornament(visibility: .visible, // 是否可见
                      attachmentAnchor: .scene(.bottom), // 附着在窗口的位置
                      contentAlignment: .bottom // 窗与ornament如何对齐
            ) {
                OrnamentControlView()
            }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
