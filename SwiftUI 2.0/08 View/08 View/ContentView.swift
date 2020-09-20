//
//  ContentView.swift
//  08 View
//
//  Created by 杨帆 on 2020/9/19.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    var title = ""
    var children: [Item]? = nil
}

let item = Item(title: "我的好友", children:
                    [
                        Item(title: "张三", children:
                             [
                                Item(title: "Swift"),
                                Item(title: "SwiftUI")
                             ]
                             ),
                        Item(title: "李四"),
                    ])

struct ContentView: View {

    var body: some View {
        VStack {
            DisclosureGroup("点击展开") {
                Text("Hello SwiftUI 2.0")
                
                DisclosureGroup("学习") {
                    Text("学习 SwiftUI 1.0")
                    Text("学习 Combine")
                }
                
            }.padding()
            
            
            OutlineGroup(item, children: \.children) { item in
                Text(item.title)
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
