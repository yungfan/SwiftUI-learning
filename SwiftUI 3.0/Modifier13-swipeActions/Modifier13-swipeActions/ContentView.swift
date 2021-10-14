//
//  ContentView.swift
//  Modifier13-swipeActions
//
//  Created by 杨帆 on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(0 ..< 10) { index in
                Text("Row-\(index)")
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button("删除", role: .destructive) {
                            print("删除")
                        }

                        Button("增加", role: .cancel) {
                            print("增加")
                        }
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            print("收藏成功")
                        } label: {
                            Label("收藏", systemImage: "star.fill")
                        }
                    }
                    .badge(index.isMultiple(of: 2) ? Text("1") : Text("new"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
