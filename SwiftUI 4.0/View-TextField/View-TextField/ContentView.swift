//
//  ContentView.swift
//  View-TextField
//
//  Created by 杨帆 on 2022/9/15.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    var body: some View {
        VStack {
            TextField("请输入用户名", text: $name, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(5, reservesSpace: true)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
