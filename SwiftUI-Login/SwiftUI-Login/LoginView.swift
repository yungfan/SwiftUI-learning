//
//  ContentView.swift
//  SwiftUI-Login
//
//  Created by 杨帆 on 2020/4/12.
//  Copyright © 2020 杨帆. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var showPassword = false
    
    @EnvironmentObject var user: UserStore
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // 背景色
            Color.blue
            
            VStack {
                // 用户名
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)
                    TextField("Username", text: $username)
                        .frame(height: 40)
                }.padding(.horizontal)
                    .background(Capsule(style: RoundedCornerStyle.continuous)
                        .fill(Color.white))
                
                // 密码
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.secondary)
                    
                    if showPassword {
                        TextField("Password", text: $password)
                            .frame(height: 40)
                    } else {
                        SecureField("Password", text: $password)
                            .frame(height: 40)
                    }
                    
                    Button(action: { self.showPassword.toggle()}) {
                        Image(systemName: "eye")
                            .foregroundColor(.secondary)
                    }
                }.padding(.horizontal)
                    .background(Capsule(style: RoundedCornerStyle.continuous)
                        .fill(Color.white))
                
                // 登录和注册按钮
                HStack() {
                    Button(action: {
                        
                        // 做一个简答的判断 然后将用户登录状态设置为true
                        if self.username == "123" && self.password == "123" {
                            
                            self.user.isLogged  = true
                            
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }, label: {
                        Text("登录")
                            .bold()
                            .foregroundColor(.primary)
                    }).frame(width: 100)
                        .padding(10)
                        .background(Capsule(style: RoundedCornerStyle.continuous)
                            .fill(Color.white))
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("注册")
                            .bold()
                            .foregroundColor(.secondary)
                    }).frame(width:100)
                        .padding(10)
                        .background(Capsule(style: RoundedCornerStyle.continuous)
                            .fill(Color.white))
                }
            }.padding(.horizontal)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
