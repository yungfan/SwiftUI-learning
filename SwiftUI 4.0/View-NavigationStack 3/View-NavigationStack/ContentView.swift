//
//  ContentView.swift
//  View-NavigationStack
//
//  Created by 杨帆 on 2022/9/15.
//

import SwiftUI

struct ContentView: View {
    var next: some View {
        Text("下一页")
            .navigationTitle("跳转标题")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                    } label: {
                        Image(systemName: "plus")
                    }
                }

                ToolbarItem(placement: .secondaryAction) {
                    Button("更新") {
                    }
                }

                ToolbarItem(placement: .secondaryAction) {
                    Button("删除") {
                    }
                }
            }
            .toolbarRole(.editor)
    }

    var body: some View {
        NavigationStack {
            List(0 ..< 30) {
                NavigationLink("Row\($0)", destination: next)
            }
            .navigationTitle("首页标题")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
