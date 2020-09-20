//
//  ContentView.swift
//  07 Modifier
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.primary

    var body: some View {
        NavigationView {
            backgroundColor
                .navigationTitle("toolbar")
                // .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Image(systemName: "heart")
                        Image(systemName: "heart")
                        Image(systemName: "heart")
                        Image(systemName: "heart")
                    }

                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "heart")
                    }

                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu("菜单") {
                            Button(action: {
                                backgroundColor = Color.purple
                            }) {
                                Label("紫色", systemImage: "pencil")
                            }

                            Button(action: {
                                backgroundColor = Color.red
                            }) {
                                Label("红色", systemImage: "trash")
                            }

                            Button(action: {
                                backgroundColor = Color.green
                            }) {
                                Label("绿色", systemImage: "plus")
                            }
                        }
                    }
                }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
