//
//  ContentView.swift
//  @SceneStorage
//
//  Created by 杨帆 on 2020/9/19.
//

import SwiftUI

struct ContentView: View {
    
    @SceneStorage("selectedTab") var selectedTab = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView{
                Text("微信").navigationBarTitle("微信", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "message")
                Text("微信")
            }.tag(0)
            
            NavigationView{
                Text("通讯录").navigationBarTitle("通讯录")
            }
            .tabItem {
                Image(systemName: "person.2")
                Text("通讯录")
            }.tag(1)
            
            NavigationView{
                Text("发现").navigationBarTitle("发现")
            }
            .tabItem {
                Image(systemName: "safari")
                Text("发现")
            }.tag(2)
            
            NavigationView{
                Text("我").navigationBarTitle("我")
            }
            .tabItem {
                Image(systemName: "person")
                Text("我")
            }.tag(3)
        }.accentColor(Color(red: 34/255.0, green: 172/255.0, blue: 37/255.0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
