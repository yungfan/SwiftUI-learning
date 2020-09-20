//
//  ContentView.swift
//  iPadOS
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI
//
// struct ContentView: View {
//    var body: some View {
//        NavigationView {
//
//            Color.red
//
//            Color.blue
//
//            //Color.green
//        }
//    }
// }

struct User: Identifiable {
    let id = UUID()
    let name: String
    let address: String
}

struct ContentView: View {
    let users = [
        User(name: "张三", address: "江苏.南京"),
        User(name: "李四", address: "浙江.杭州"),
        User(name: "王五", address: "安徽.芜湖"),
    ]

    var body: some View {
        NavigationView {
            List(users) { user in

                NavigationLink(destination: DetailsView(stu: user)) {
                    Label(user.name, systemImage: "person")
                }
            }.listStyle(SidebarListStyle())

            Text("AAA")
        }
    }
}

struct DetailsView: View {
    var stu: User

    var body: some View {
        VStack {
            Text(stu.name)

            Text(stu.address)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
