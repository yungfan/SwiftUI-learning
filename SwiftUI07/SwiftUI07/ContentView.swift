//
//  ContentView.swift
//  SwiftUI07
//
//  Created by 杨帆 on 2019/10/19.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
        
            Button("点击我"){
                print("Hello World")
            
            }
            
            Button(action: {
                print("Login")
            }) {
                
                Image(systemName: "person.fill").resizable().frame(width: 50, height: 50).foregroundColor(.orange)
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
