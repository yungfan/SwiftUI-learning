//
//  ContentView.swift
//  01 View-Syntax
//
//  Created by 杨帆 on 2020/9/19.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name: String? = "YungFan"
    
    var body: some View {
        
        if let name = name {
            Text("欢迎你\(name)")
        }
        else {
            Button("请登录") {
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
