//
//  ContentView.swift
//  SwiftUI-iOS
//
//  Created by 杨帆 on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
        
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
        
        ContentView()
            .previewInterfaceOrientation(.portrait)
        
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
