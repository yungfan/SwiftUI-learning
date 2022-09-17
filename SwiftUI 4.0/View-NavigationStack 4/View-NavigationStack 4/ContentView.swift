//
//  ContentView.swift
//  View-NavigationStack 4
//
//  Created by 杨帆 on 2022/9/15.
//

import SwiftUI

struct ContentView: View {
    @State private var names = ["zhangsan", "lisi"]
    @State private var path: [String] = []

    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                List {
                    ForEach(names, id: \.self) { name in
                        NavigationLink(name, value: name)
                    }
                }
                .navigationTitle("Names")
                .navigationDestination(for: String.self) { name in
                    Text(name)
                        .navigationTitle("姓名")
                        .foregroundStyle(.red)
                }
            }

            HStack {
                Button("跳转") {
                    path.append("New")
                }

                Button("返回") {
                    path.removeLast()
                }
                .disabled(path.count == 0)

                Button("返回Root") {
                    path.removeLast(path.count)
                }
                .disabled(path.count == 0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
