//
//  ContentView.swift
//  View-NavigationSplitView
//
//  Created by 杨帆 on 2022/9/15.
//

import SwiftUI

struct Student: Identifiable, Hashable {
    var id: Self { self }
    var name: String
}

struct ContentView: View {
    @State private var columnVisibility = NavigationSplitViewVisibility.detailOnly
    @State private var students: [Student] = [.init(name: "zhangsan"), .init(name: "lisi")]

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List {
                ForEach(students) { student in
                    Text(student.name)
                }
            }
            .navigationSplitViewColumnWidth(250)
        } content: {
            Color.teal
        } detail: {
            Color.red
        }
        .navigationSplitViewStyle(.balanced)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
