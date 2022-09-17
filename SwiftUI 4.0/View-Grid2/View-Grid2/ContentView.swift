//
//  ContentView.swift
//  View-Grid2
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid(alignment: .trailing) {
            GridRow(alignment: .center) {
                Text("用户名")
                
                TextField("请输入用户名", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
            }
            .frame(height: 50)
            
            GridRow {
                Text("密码")
                
                SecureField("请输入密码", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
            }
            .frame(height: 50)
            
            GridRow {
                Button {
                    
                } label: {
                    Text("登录")
                        .padding(.horizontal)
                }
                .foregroundStyle(.white)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)

                
                Button {
                    
                } label: {
                    Text("注册")
                        .padding(.horizontal)
                }
                .foregroundStyle(.white)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
