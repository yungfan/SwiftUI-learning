//
//  ContentView.swift
//  动画
//
//  Created by 杨帆 on 2023/9/13.
//

import SwiftUI

struct ContentView: View {
    @State private var value = false

    var body: some View {
        Text("WWDC23")
            .scaleEffect(value ? 2 : 1)
            .onTapGesture {
                withAnimation {
                    value.toggle()
                } completion: {
                    print("动画完成")
                }
            }
    }
}


#Preview {
    ContentView()
}
