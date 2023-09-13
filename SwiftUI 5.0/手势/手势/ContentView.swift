//
//  ContentView.swift
//  手势
//
//  Created by 杨帆 on 2023/9/13.
//

import SwiftUI

struct ContentView: View {
    @State private var angle = Angle(degrees: 0.0)

    var rotation: some Gesture {
        RotateGesture()
            .onChanged { value in
                angle = value.rotation
            }
    }

    @GestureState private var scale = 1.0

    var magnify: some Gesture {
        MagnifyGesture()
            .updating($scale) { value, gestureState, _ in
                gestureState = value.magnification
            }
    }

    var body: some View {
        VStack {
            Rectangle()
                .foregroundStyle(.red)
                .frame(width: 200, height: 200)
                .rotationEffect(angle)
                .gesture(rotation)

            Circle()
                .foregroundStyle(.green)
                .frame(width: 200, height: 200)
                .scaleEffect(scale)
                .gesture(magnify)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
