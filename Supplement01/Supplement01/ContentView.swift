//
//  ContentView.swift
//  Supplement01
//
//  Created by 杨帆 on 2019/11/5.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // 声明一个isActive
    @State var isActive = false
    
    var body: some View {
        NavigationView {
            // NavigationLink按下的时候会设置为true，在适当的地方将其设置为false就可以返回
            NavigationLink(destination: NextView(isActive: $isActive), isActive: $isActive) {
                Text("跳转")
            }.navigationBarTitle("导航")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
