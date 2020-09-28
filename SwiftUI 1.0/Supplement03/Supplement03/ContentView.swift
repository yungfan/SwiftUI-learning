//
//  ContentView.swift
//  Supplement03
//
//  Created by 杨帆 on 2019/11/23.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimated = false
    
    var body: some View {
        VStack {
            Button(action: {
                
                self.isAnimated.toggle()
                
            }) {
                Text("按钮")
                    .offset(x: isAnimated ? 50 : 0, y: isAnimated ? 50 : 0)
                    .frame(width: isAnimated ? 200.0 : 100, height: isAnimated ? 200.0 : 100, alignment: .center)
                    .background(isAnimated ? Color.purple : Color.green)
                    .opacity(isAnimated ? 0.2 : 1.0)
                    .cornerRadius(isAnimated ? 20 : 0)
                    .animation(.linear(duration: 2.0))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
