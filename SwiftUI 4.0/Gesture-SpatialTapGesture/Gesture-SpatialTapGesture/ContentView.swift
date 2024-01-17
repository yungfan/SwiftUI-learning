//
//  ContentView.swift
//  Gesture-SpatialTapGesture
//
//  Created by 杨帆 on 2024/1/17.
//

import SwiftUI

struct ContentView: View {
    @State private var location: CGPoint = .zero

    var tap: some Gesture {
        SpatialTapGesture()
            .onEnded { event in
                self.location = event.location
            }
    }

    // 需要点击3次才触发
    var tap3: some Gesture {
        SpatialTapGesture(count: 3)
            .onEnded { event in
                self.location = event.location
            }
    }

    var body: some View {
        ZStack {
            Color
                .white
                // .gesture(tap)
                .gesture(tap3)

            Circle()
                .fill(Color.red)
                .frame(width: 20, height: 20, alignment: .center)
                .position(location == .zero ? .init(x: 100, y: 100) : location)
        }
    }
}

#Preview {
    ContentView()
}
