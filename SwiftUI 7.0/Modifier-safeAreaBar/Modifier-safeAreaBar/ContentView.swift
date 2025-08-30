//
//  ContentView.swift
//  Modifier-safeAreaBar
//
//  Created by 杨帆 on 2025/08/30  08:41.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0 ..< 20) { index in
                    Text(index.description)
                        .font(.title)
                        .padding()
                }
            }
            .navigationTitle("safeAreaBar")
            .safeAreaBar(edge: .bottom) {
                Button("Button") {
                }
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .buttonSizing(.flexible)
                .padding()
            }
        }
    }
}


#Preview {
    ContentView()
}
