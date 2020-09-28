//
//  ContentView.swift
//  SwiftUI31
//
//  Created by 杨帆 on 2019/10/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct User {
    var name: String
    var job: String
    var email: String
    var profilePicture: String
}


struct ProfilePicture: View {
    
    var imageName: String
    
    var body: some View {
        
        Image(imageName).resizable().frame(width: 100, height: 100) .clipShape(Circle())
        
    }
    
}


struct Email: View {
    
    var email: String
    
    var body: some View {
        
        
        HStack {
            
           Image(systemName: "envelope")
            
            Text(email)
            
        }
    }
    
}

struct UserDetails: View {
    
    var user: User
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            
           
            Text(user.name).font(.largeTitle)
            Text(user.job).font(.system(size: 18)).foregroundColor(.gray)
            
            Email(email: user.email)
            
        }
    }
    
}




struct ContentView: View {
    
    
    let user = User(name: "YungFan", job: "教师，开发者", email: "yangfan@abc.edu.cn", profilePicture: "yf")
    
    var body: some View {
        
        HStack {
            
            ProfilePicture(imageName: user.profilePicture).padding()
            
            
            
            UserDetails(user: user)
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
