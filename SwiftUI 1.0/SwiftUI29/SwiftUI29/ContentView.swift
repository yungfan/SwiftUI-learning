//
//  ContentView.swift
//  SwiftUI29
//
//  Created by 杨帆 on 2019/10/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI


struct DIYModifer: ViewModifier {
    
    func body(content: Content) -> some View {
        
        return content.foregroundColor(.red).font(.title).padding()
        
        
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello World").modifier(DIYModifer())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
