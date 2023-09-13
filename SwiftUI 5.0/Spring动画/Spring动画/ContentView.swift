//
//  ContentView.swift
//  Spring动画
//
//  Created by 杨帆 on 2023/9/13.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false

    var body: some View {
        VStack(spacing: 20) {
            Text("WWDC22")
                .foregroundColor(show ? .green : .red)
                .tracking(show ? 0 : 10)
                .font(.system(size: show ? 40 : 20))
                .fontWeight(show ? .black : .thin)

            Button("产生动画") {
                withAnimation(Animation.spring(duration: 2.0, bounce: 0.7, blendDuration: 0)) { // 新的Spring动画
                    show.toggle()
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
