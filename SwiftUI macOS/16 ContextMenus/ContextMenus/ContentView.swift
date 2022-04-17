//
//  ContentView.swift
//  ContextMenus
//
//  Created by 杨帆 on 2022/4/17.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.orange
    var items = ["紫", "红", "白"]
    var colors: [Color] = [.purple, .red, .white]
    @State private var currentIndex: Int = 2

    var body: some View {
        NavigationView {
            ZStack {
                colors[currentIndex]

                // 点击菜单
                Menu("菜单") {
                    Picker("颜色", selection: $currentIndex) {
                        ForEach(0 ..< self.items.count) { index in
                            Text(self.items[index])
                                .tag(index)
                        }
                    }
                }
                .padding()
            }

            ZStack {
                backgroundColor
            }
            .navigationTitle("菜单")
            .contextMenu { // 右击菜单
                Button(action: {
                    backgroundColor = Color.orange
                }) {
                    Text("橘色")
                    Image(systemName: "pencil")
                }

                Button(action: {
                    backgroundColor = .green
                }) {
                    Image(systemName: "plus")
                    Text("绿色")
                }
            }
            .toolbar {
                // 分享菜单
                Menu(content: {
                         ForEach(NSSharingService.sharingServices(forItems: [""]), id: \.self) { item in
                             Button(action: {}) {
                                 Image(nsImage: item.image)
                                 Text(item.title)
                             }
                         }
                     },
                     label: {
                         Image(systemName: "square.and.arrow.up")
                     }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
