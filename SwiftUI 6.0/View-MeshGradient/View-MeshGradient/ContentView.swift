//
//  ContentView.swift
//  View-MeshGradient
//
//  Created by 杨帆 on 2024/6/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false

    var body: some View {
        MeshGradient(width: 3,
                     height: 3,
                     points: [
                         .init(0, 0), .init(0.5, 0), .init(1, 0),
                         .init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
                         .init(0, 1), .init(0.5, 1), .init(1, 1),
                     ],
                     colors: [
                         .red, .purple, .indigo,
                         .orange, isAnimating ? .white : .black, .blue,
                         .yellow, .green, .mint,
                     ],
                     smoothsColors: true,
                     colorSpace: .perceptual
        )
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                isAnimating.toggle() // width、height、points、colors均可产生动画
            }
        }
    }
}

#Preview {
    ContentView()
}
