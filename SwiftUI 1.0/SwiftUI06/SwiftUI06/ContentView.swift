//
//  ContentView.swift
//  SwiftUI06
//
//  Created by 杨帆 on 2019/10/19.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            
            TextField("请输入用户名", text: .constant("zhangsan")).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            SecureField("请输入密码", text: .constant("123456")).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            
            Spacer()
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
