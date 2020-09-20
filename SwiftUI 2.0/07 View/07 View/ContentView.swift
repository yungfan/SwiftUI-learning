//
//  ContentView.swift
//  07 View
//
//  Created by 杨帆 on 2020/9/19.
//

import SwiftUI

struct ContentView: View {
    // @State private var bgColor = Color.primary

    @State private var selectedIndex = 0

    var colors: [Color] = [.orange, .purple, .red]

    var texts = ["橘色", "紫色", "红色"]

    var body: some View {
        ZStack {
            colors[selectedIndex]

            //            Menu {
            //                Menu("其他")
            //                {
            //                    Button(action: {
            //                        bgColor = .orange
            //                    }, label: {
            //                        Text("橙色")
            //                    })
            //
            //                    Button(action: {
            //                        bgColor = .red
            //                    }, label: {
            //                        Text("红色")
            //                    })
            //                }
            //
            //                Section {
            //                    Button(action: {
            //                        bgColor = .orange
            //                    }, label: {
            //                        Text("橙色")
            //                    })
            //
            //                    Button(action: {
            //                        bgColor = .red
            //                    }, label: {
            //                        Text("红色")
            //                    })
            //                }
            //
            //                Section {
            //                    Button(action: {
            //                        bgColor = .purple
            //                    }, label: {
            //                        Text("紫色")
            //                    })
            //
            //                    Button(action: {
            //                        bgColor = .green
            //                    }, label: {
            //                        Text("绿色")
            //                    })
            //                }
            //            } label: {
            //                Label("菜单", systemImage: "heart")
            //                    .foregroundColor(Color.gray)
            //            }

            Menu("菜单") {
                Picker("选择颜色", selection: $selectedIndex) {
//                    ForEach(texts, id:\.self) { text in
//
//                        Text(text)
//                    }

                    ForEach(0 ..< self.texts.count) { index in
                        Text(texts[index])
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
