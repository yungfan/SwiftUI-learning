//
//  ContentView.swift
//  Modifier11-searchable
//
//  Created by 杨帆 on 2021/10/13.
//

import SwiftUI

struct ContentView: View {
    @State private var names = ["ZhangSan", "LiSi", "Wangwu", "zhangwu"]

    @State private var queryString = ""

    var filterNames: [String] {
        if queryString.isEmpty {
            return names
        } else {
            return names.filter {
                $0.localizedCaseInsensitiveContains(queryString)
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                List(filterNames, id: \.self) { name in
                    Text(name)
                }

                SearchContent()
            }

            .navigationTitle("搜索")
        }
        .searchable(text: $queryString, prompt: "请输入关键字")
    }
}

struct SearchContent: View {
    @Environment(\.isSearching) var isSearching
    @Environment(\.dismissSearch) var dismissSearch

    var body: some View {
        Text(isSearching ? "正在搜索" : "没有搜索")
            .onTapGesture {
                dismissSearch()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
