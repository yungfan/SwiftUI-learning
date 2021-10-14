//
//  ContentView.swift
//  Modifier19-animation
//
//  Created by 杨帆 on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    @State private var scale = false
    
    var body: some View {
        Image(systemName: "heart")
            .resizable()
            .frame(width: 40, height: 40)
            .scaleEffect(scale ? 2.0 : 1.0)
            .animation(.default, value: scale)
            .onTapGesture {
                scale.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
