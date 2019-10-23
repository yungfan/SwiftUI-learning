//
//  ContentView.swift
//  SwiftUI39
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

class User: ObservableObject {

    @Published var name: String = ""

}


struct UserView: View {

    @EnvironmentObject var user: User

    var body: some View {
    
        Text(user.name)
    
    }
}


struct ContentView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                Text(user.name)
                
                Button("改变name"){
                    
                    self.user.name = "zhangsan"
                    
                }
                
                NavigationLink(destination: UserView()) {
                               Text("跳转")
                           }
            }.navigationBarTitle("User", displayMode: .inline)
            
           
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
