//
//  ContentView.swift
//  Containers
//
//  Created by 杨帆 on 2019/6/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

/**

struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}
 */

/**
//导航
struct ContentView : View {
    var body: some View {
        
        NavigationView {
            //导航界面的内容（类似于以前的控制器的内容）
            Text("SwiftUI")
                //导航上的标题（类似于以前的导航条上的标题）
                //加上displayMode和以前的导航条一样
                .navigationBarTitle(Text("Welcome"), displayMode: .inline)
                //左右两侧的Items
                .navigationBarItems(leading:
                    Button(action: {
                        print("Add tapped!")
                    }) {
                        Text("Add")
                    },
                                    trailing:
                    Button(action: {
                        print("Help tapped!")
                    }) {
                        Text("Help")
                })
            
        }
        
    }
}

 */

/**
 //标签
struct ContentView : View {
    
    @State private var index = 0 // 默认选中索引
    private let imgs = ["tab_me_nor", "tab_qworld_nor", "tab_recent_nor"]
    private let txts = ["设置", "喜欢", "信息"]
    
    var body: some View {
        
        TabbedView(selection: $index){
            
            ForEach(0 ..< self.imgs.count) { i in
                
                Text(self.txts[i])
                    .font(.title)
                    .tabItemLabel(
                        VStack {
                            Image(self.imgs[i])
                            Text(self.txts[i]).font(.title)
                    })
                    .tag(i)
            }
        }
        
    }
}
*/

//导航配合标签
struct ContentView : View {
    
    @State private var selection = 0
    
    private let imgs = ["tab_me_nor", "tab_qworld_nor", "tab_recent_nor"]
    private let txts = ["设置", "喜欢", "信息"]
    
    var body: some View {
        
        TabbedView(selection: $selection) {
            
            NavigationView {
                Text("First")
                    .navigationBarTitle(Text("First"))
                }
                .tabItemLabel(
                    VStack {
                        Image(self.imgs[0])
                        Text(self.txts[0]).font(.title)
                })
                .tag(0)
            
            NavigationView {
                Text("Second")
                    .navigationBarTitle(Text("Second"))
                }
                .tabItemLabel(
                    VStack {
                        Image(self.imgs[1])
                        Text(self.txts[1]).font(.title)
                })
                .tag(1)
            
            NavigationView {
                Text("Third")
                    .navigationBarTitle(Text("Third"))
                }
                .tabItemLabel(
                    VStack {
                        Image(self.imgs[2])
                        Text(self.txts[2]).font(.title)
                })
                .tag(2)
            
        }
    }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
