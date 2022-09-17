//
//  ContentView.swift
//  Modifier-contentTransition
//
//  Created by 杨帆 on 2022/9/17.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false

    var body: some View {
        VStack(spacing: 30) {
            Text("Hello, world!")
                .foregroundColor(show ? .green : .red)
                .font(.system(size: show ? 40 : 20))
                .fontWeight(show ? .black : .thin)
                .contentTransition(.interpolate)
            
            Button("产生动画") {
                withAnimation(Animation.easeInOut(duration: 3.0)) {
                    show.toggle()
                }
            }
        }
        .persistentSystemOverlays(.hidden)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
