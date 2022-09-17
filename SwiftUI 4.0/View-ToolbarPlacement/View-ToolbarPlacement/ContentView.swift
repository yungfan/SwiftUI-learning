//
//  ContentView.swift
//  View-ToolbarPlacement
//
//  Created by 杨帆 on 2022/9/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                NavigationLink("微信", value: "微信")
                    .navigationTitle("微信")
                    .navigationDestination(for: String.self) { value in
                        Text(value)
                            .toolbar(.hidden, for: .tabBar)
                    }
            }
            .tabItem {
                Image(systemName: "message")
                Text("微信")
            }

            NavigationStack {
                NavigationLink("通讯录", value: "通讯录")
                    .navigationTitle("通讯录")
                    .navigationDestination(for: String.self) { value in
                        Text(value)
                    }
            }
            .tabItem {
                Image(systemName: "person.2")
                Text("通讯录")
            }

            NavigationStack {
                NavigationLink("发现", value: "发现")
                    .navigationTitle("发现")
                    .navigationDestination(for: String.self) { value in
                        Text(value)
                    }
            }
            .tabItem {
                Image(systemName: "safari")
                Text("发现")
            }

            NavigationStack {
                NavigationLink("我", value: "我")
                    .navigationTitle("我")
                    .navigationDestination(for: String.self) { value in
                        Text(value)
                    }
            }
            .tabItem {
                Image(systemName: "person")
                Text("我")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
