//
//  ContentView.swift
//  SwiftUI01
//
//  Created by 杨帆 on 2019/10/18.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            Text("Hello")
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            
            ContentView().previewDevice("iPhone 8").previewDisplayName("iPhone 8")
            
            ContentView().previewDevice("iPhone X").previewDisplayName("iPhone X").environment(\.colorScheme, .dark)
            
            
        }
    }
}
