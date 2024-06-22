//
//  ContentView.swift
//  WindowDragGesture
//
//  Created by 杨帆 on 2024/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .gesture(WindowDragGesture()) // 单击并拖移视图以移动窗口
    }
}

#Preview {
    ContentView()
}
