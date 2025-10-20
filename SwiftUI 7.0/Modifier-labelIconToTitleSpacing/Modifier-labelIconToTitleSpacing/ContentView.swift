//
//  ContentView.swift
//  Modifier-labelIconToTitleSpacing
//
//  Created by 杨帆 on 2025/08/27  22:09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Label
            Label("登录", systemImage: "person")

            Label("登录", systemImage: "person")
                .labelIconToTitleSpacing(30)

            // Button
            Button("登录", systemImage: "person") {
            }

            Button("登录", systemImage: "person") {
            }
            .labelIconToTitleSpacing(40)
        }
    }
}


#Preview {
    ContentView()
}
