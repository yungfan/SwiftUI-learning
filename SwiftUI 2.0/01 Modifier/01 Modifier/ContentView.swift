//
//  ContentView.swift
//  01 Modifier
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isShow = false

    var body: some View {
//        Button("弹出Modal") {
//            isShow.toggle()
//
//        }.fullScreenCover(isPresented: $isShow, content: {
//            ZStack {
//                Color.red
//
//                Button("回到主界面") {
//                    isShow = false
//                }
//            }
//
//        })

        List {
            Section {
                Label("AAA", systemImage: "heart")
                    .listItemTint(.green)

                Label("BBB", systemImage: "heart")

                Label("CCC", systemImage: "heart")
            }

            Section {
                Label("CCC", systemImage: "heart")

                Label("BBB", systemImage: "heart")

                Label("AAA", systemImage: "heart")
            }.listItemTint(.orange)
        }.listStyle(SidebarListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
