//
//  ContentView.swift
//  SwiftUI24
//
//  Created by 杨帆 on 2019/10/20.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct NewView: View {
    
    var body: some View {
        
        
        Text("新界面")
        
    }
    
}

struct User: Identifiable {
    var id = UUID()
    var name: String
}


struct ContentView: View {
    
    //@State var sheet:Bool = false
    
    // 数据源
    let users = [User(name:"ZhangSan"), User(name:"LiSi"), User(name:"WangWu")]
    
    var body: some View {
        /*
         
         Button("Modal"){
         
         self.sheet = true
         
         }.sheet(isPresented: $sheet) {
         
         NewView()
         }
         */
        
        /*
         NavigationView {
         
         NavigationLink(destination: NewView()) {
         
         Text("跳转")
         
         }.navigationBarTitle("标题")
         }
         */
        
        
        
        // 通过数据源构造列表
        
        NavigationView{
        
            List(users) { user in
            
                NavigationLink(destination: NewView()) {
                Text(user.name)
                }
            }.navigationBarTitle("Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
