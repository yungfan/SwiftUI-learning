//
//  ContentView.swift
//  09 View
//
//  Created by 杨帆 on 2020/9/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollViewReader { proxy in
            Button("滚动到指定位置") {
                withAnimation {
                    proxy.scrollTo(50, anchor: .center)
                }
            }

            List(1 ..< 100) { index in
                Text("\(index)")
                    .background(Circle()
                        .fill(Color(red: Double(index) / 100.0, green: 0.5, blue: 0.5))
                        .frame(width: 50, height: 50))
                    .padding()
                    .id(index)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
