//
//  ContentView.swift
//  FloatWindow
//
//  Created by 杨帆 on 2025/1/11.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        Button("Open Window") {
            openWindow(id: "FloatWindow")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
