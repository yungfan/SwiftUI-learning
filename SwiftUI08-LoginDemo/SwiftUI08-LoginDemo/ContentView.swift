//
//  ContentView.swift
//  SwiftUI08-LoginDemo
//
//  Created by 杨帆 on 2019/10/19.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = ""
    
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
            
            Image(systemName: "person.fill").resizable().frame(width: 80, height: 80).foregroundColor(.orange)
            
            TextField("请输入用户名", text: $name).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            SecureField("请输入密码", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            Button("登录") {
                
                print(self.name)
                print(self.password)
                
            }
            
            Spacer()
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
