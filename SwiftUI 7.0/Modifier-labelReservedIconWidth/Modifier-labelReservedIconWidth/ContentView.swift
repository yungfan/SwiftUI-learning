//
//  ContentView.swift
//  Modifier-labelReservedIconWidth
//
//  Created by 杨帆 on 2025/10/20  09:41.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Label("iPhone", systemImage: "iphone")

            Label("iPad", systemImage: "ipad")

            Label("MacBook", systemImage: "macbook")
        }
        .padding()

        VStack(alignment: .leading, spacing: 20) {
            Label("iPhone", systemImage: "iphone")

            Label("iPad", systemImage: "ipad")

            Label("MacBook", systemImage: "macbook")
        }
        .labelReservedIconWidth(20)
        .padding()
    }
}


#Preview {
    ContentView()
}
