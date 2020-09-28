//
//  ContentView.swift
//  SwiftUI16
//
//  Created by 杨帆 on 2019/10/19.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI


//struct User: Identifiable {
//    var id = UUID()
//    var name: String
//}
//
//struct ContentView: View {
//
//    let users = [User(name: "zhangsan"), User(name: "lisi")]
//
//    var body: some View {
//
//
//        List(users) {
//
//            user in
//
//            Text(user.name)
//
//        }
//
//    }
//}



struct ContentView: View {
    
    let users = ["zhangsan", "lisi"]
    
    var body: some View {
       
        
        List {
            
            ForEach(users, id: \.self) { user in
                Text(user)
            }
            
            
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
