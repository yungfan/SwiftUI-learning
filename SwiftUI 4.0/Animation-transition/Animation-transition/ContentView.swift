//
//  ContentView.swift
//  Animation-transition
//
//  Created by 杨帆 on 2022/9/17.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false

    var body: some View {
        VStack {
            if show {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.push(from: .leading)) // 从左往右消失
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.teal)
                    .frame(width: 200, height: 200)
                    .transition(.push(from: .top)) // 从上往下消失
            }
        }
        .onTapGesture {
            withAnimation(.linear(duration: 3)) {
                show.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
