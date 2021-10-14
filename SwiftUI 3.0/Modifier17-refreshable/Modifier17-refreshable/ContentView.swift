//
//  ContentView.swift
//  Modifier17-refreshable
//
//  Created by 杨帆 on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    @State private var names = ["Zhangsan", "Lisi", "Wangwu"]

    var body: some View {
        List {
            ForEach(names, id: \.self) { name in
                Text(name)
                    .padding()
            }
        }
        .refreshable {
            await loadMore()
        }
    }
    
    func loadMore() async {
        guard let url = URL(string: "https://httpbin.org/delay/2") else { return }
        
        _ =  try! await URLSession.shared.data(for: URLRequest(url: url), delegate: nil)
        
        names.append("Zhaoliu")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
