//
//  ContentView.swift
//  SwiftUI21-Tab&Navigation
//
//  Created by 杨帆 on 2019/10/20.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = .red
        UINavigationBar.appearance().barTintColor = .cyan
    }
    
    
    var body: some View {
        
        TabView {
            
            NavigationView{
                
                Text("微信").navigationBarTitle("微信", displayMode: .inline)
                
            }.tabItem {
                
                Image(systemName: "message")
                Text("微信")
                
            }
            
            NavigationView{
                
                Text("通讯录").navigationBarTitle("通讯录")
                
            }.tabItem {
                
                Image(systemName: "person.2")
                Text("通讯录")
                
            }
            
            NavigationView{
                
                Text("发现").navigationBarTitle("发现")
                
            }.tabItem {
                
                Image(systemName: "safari")
                Text("发现")
                
            }
            
            NavigationView{
                
                Text("我").navigationBarTitle("我")
                
            }.tabItem {
                
                Image(systemName: "person")
                Text("我")
                
            }
        }.accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
