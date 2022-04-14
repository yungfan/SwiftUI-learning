//
//  ContentView.swift
//  Menu
//
//  Created by 杨帆 on 2022/4/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()
                .toolbar { // 左侧工具栏菜单
                    ToolbarItem(placement: .automatic) {
                        Button {
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }

            ZStack {
                Color.orange

                Text("主界面")
            }
            .toolbar {
                ToolbarItem(placement: .automatic) { // 右侧工具栏菜单
                    Button {
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            .navigationTitle("Menus")
        }
        .frame(minWidth: 700,
               idealWidth: 1000,
               maxWidth: .infinity,
               minHeight: 400,
               idealHeight: 800,
               maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
