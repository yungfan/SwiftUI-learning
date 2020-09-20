//
//  ContentView.swift
//  @AppStorage
//
//  Created by 杨帆 on 2020/9/19.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("username") var text: String = "zhangsan"
    
    var body: some View {
        
        VStack {
            Text("你好\(text)")
                .padding()
            
            
            TextField("用户名", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
