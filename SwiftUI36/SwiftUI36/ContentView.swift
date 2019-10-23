//
//  ContentView.swift
//  SwiftUI36
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct User {
    
    var name: String
    var email: String
    
}

struct ContentView: View {
    
    var user = User(name: "zhangsan", email: "zhangsan@qq.com")
    
    var body: some View {
        
        
        VStack{
            
            Text(user.name).font(.largeTitle).bold().foregroundColor(.orange)
            
            Text(user.email).italic()
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
