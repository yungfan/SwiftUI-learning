//
//  ContentView.swift
//  SwiftUI15
//
//  Created by 杨帆 on 2019/10/19.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        List{
            
            Section(header: Text("头部1"), footer: Text("尾部1")) {
                Text("Hello")
                Image(systemName: "cloud")
            }
            
            Section(header: Text("头部2")) {
                Text("SwiftUI")
                Image(systemName: "person")
            }
 
        }.listStyle(GroupedListStyle())
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
