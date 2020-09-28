//
//  ContentView.swift
//  SwiftUI20
//
//  Created by 杨帆 on 2019/10/20.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected: Int = 1
    
    var body: some View {
        
        TabView(selection: $selected) {
            
            Text("第一页").tabItem {
                
                Image(systemName: "person")
                Text("人")
                
            }.tag(0)
            
            Text("第二页").tabItem {
                
                Image(systemName: "cloud")
                Text("云")
                
            }.tag(1)
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
