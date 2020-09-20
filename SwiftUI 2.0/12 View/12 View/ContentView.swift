//
//  ContentView.swift
//  12 View
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI

struct Friend: Identifiable {
    var id = UUID()
    var name: String
    var friends: [Friend]?
    
}

struct ContentView: View {
    
    
    let data = [ Friend(name: "好友列表", friends: [Friend(name: "张三"), Friend(name: "李四")]),
                 Friend(name: "同事列表", friends: [Friend(name: "张三2"), Friend(name: "李四2")]),
                 Friend(name: "同学列表", friends: [Friend(name: "张三3"), Friend(name: "李四3")])
                 ]
    
    var body: some View {
        
//        VStack {
//
//            List(0..<5) { index in
//                Text("AA")
//            }.listStyle(InsetListStyle())
//
//
//            List(5..<10) { index in
//                Text("BB")
//            }.listStyle(InsetGroupedListStyle())
//
//            List(10..<15) { index in
//                Text("CC")
//            }.listStyle(SidebarListStyle())
//        }
        
        List(data, children: \.friends) { friend in
            Text(friend.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
