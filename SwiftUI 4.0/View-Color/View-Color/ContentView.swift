//
//  ContentView.swift
//  View-Color
//
//  Created by 杨帆 on 2022/9/15.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
    
    var body: some View {
        VStack {
            ForEach(colors, id:\.self) { color in
                Rectangle()
                    // .fill(color.gradient)
                    // .fill(color.shadow(.drop(color:.teal, radius: 6)))
                    .fill(color.shadow(.inner(color:.teal,radius: 6)))
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
