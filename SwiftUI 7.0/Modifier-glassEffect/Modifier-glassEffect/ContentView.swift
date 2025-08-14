//
//  ContentView.swift
//  Modifier-glassEffect
//
//  Created by 杨帆 on 2025/08/14  14:52.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                HStack {
                    Text("Glass Effect")
                        .padding()
                        .frame(width: 150)
                        .glassEffect()

                    Image(systemName: "suit.heart.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.red.gradient)
                        .frame(width: 50, height: 50)
                        .glassEffect()

                    Button {
                    } label: {
                        Text("Action")
                    }
                    .padding()
                    .glassEffect()
                }

                HStack {
                    Text("Glass Effect")
                        .padding()
                        .frame(width: 150)
                        .glassEffect(.clear.interactive(), in: .capsule)

                    Image(systemName: "suit.heart.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.red.gradient)
                        .frame(width: 50, height: 50)
                        .glassEffect(.clear.interactive(), in: .circle)

                    Button {
                    } label: {
                        Text("Action")
                    }
                    .padding()
                    .glassEffect(.clear.interactive(), in: .capsule)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
