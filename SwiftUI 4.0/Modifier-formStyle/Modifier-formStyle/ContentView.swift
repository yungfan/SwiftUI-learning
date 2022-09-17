//
//  ContentView.swift
//  Modifier-formStyle
//
//  Created by 杨帆 on 2022/9/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            TextField("用户名", text: .constant(""))
                //.textFieldStyle(.roundedBorder)
            
            SecureField("密码", text: .constant(""))
               // .textFieldStyle(.roundedBorder)
            
            Button("登录") {}
        }
        .formStyle(.automatic)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
