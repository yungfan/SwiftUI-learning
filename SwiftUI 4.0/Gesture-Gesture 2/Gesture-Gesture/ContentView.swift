//
//  ContentView.swift
//  Gesture-Gesture
//
//  Created by 杨帆 on 2022/9/17.
//

import SwiftUI

struct ContentView: View {
    @State private var delta = 0.0

    var body: some View {
        Text("手势差值：\(delta)")
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .contentShape(Rectangle())
            .gesture(DragGesture().onChanged { value in
                delta = value.location.y - value.startLocation.y
            })
            .defersSystemGestures(on: .vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
