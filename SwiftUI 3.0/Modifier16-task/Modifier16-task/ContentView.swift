//
//  ContentView.swift
//  Modifier16-task
//
//  Created by 杨帆 on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    @State private var content = ""

    var body: some View {
        NavigationView {
            ScrollView {
                Text(content)
                    .padding()
                    .task {
                        guard let url = URL(string: "https://www.baidu.com") else { return }

                        do {
                            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url), delegate: nil)

                            content = String(data: data, encoding: .utf8)!

                        } catch {
                            content = "出现异常"
                        }
                    }
            }.navigationTitle("搜索一下")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
