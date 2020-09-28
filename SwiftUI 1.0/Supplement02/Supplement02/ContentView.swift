//
//  ContentView.swift
//  Supplement02
//
//  Created by 杨帆 on 2019/11/9.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingMenuView = false
    var body: some View {
        
        NavigationView {
            ZStack {
                // 显示的内容
                List{
                    
                    Text("这是第一条记录")
                    Text("这是第二条记录")
                    Text("这是第三条记录")
                    Text("这是第四条记录")
                }
                
                // 根据条件显示菜单
                if self.showingMenuView {
                    MenuView(showingMenuView: self.$showingMenuView)

                }
            }
            .navigationBarTitle(Text("记事本"), displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    self.showingMenuView.toggle()
                }, label: {
                    Image(systemName: "list.dash")
                })
                
            )
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
