//
//  ContentView.swift
//  Modifier-toolbarVisibility
//
//  Created by 杨帆 on 2024/9/7.
//

import SwiftUI

struct ContentView: View {
    @State private var isScrolling = false

    var body: some View {
        TabView {
            Tab {
                NavigationStack {
                    ScrollView {
                        ForEach(1 ..< 100, id: \.self) { number in
                            Text(number.formatted())
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 300, height: 180)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.purple))
                        }
                    }
                    .navigationTitle("微信")
                    .navigationBarTitleDisplayMode(.inline)
                    .onScrollPhaseChange { oldPhase, newPhase in
                        withAnimation {
                            switch newPhase {
                            case .idle:
                                isScrolling = false
                            case .tracking, .interacting, .decelerating, .animating:
                                isScrolling = true
                            }
                        }
                    }
                    .toolbarVisibility(isScrolling ? .hidden : .visible, for: .navigationBar) // 显隐导航栏
                    .toolbarVisibility(isScrolling ? .hidden : .visible, for: .tabBar) // 显隐标签栏
                }
            } label: {
                Label("微信", systemImage: "message")
            }
        }
    }
}


#Preview {
    ContentView()
}
