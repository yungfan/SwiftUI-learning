//
//  ContentView.swift
//  Modifier14-badge
//
//  Created by 杨帆 on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("首页")
                .tabItem {
                    Text("首页")

                    Image(systemName: "house")
                }
                .badge(1)

            Text("消息")
                .tabItem {
                    Text("消息")

                    Image(systemName: "message")
                }
                .badge("new")

            Text("通讯录")
                .tabItem {
                    Text("通讯录")

                    Image(systemName: "person")
                }
                .badge(Text("100"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
