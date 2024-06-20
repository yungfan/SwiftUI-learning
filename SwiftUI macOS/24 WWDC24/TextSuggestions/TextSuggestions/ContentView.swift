//
//  ContentView.swift
//  TextSuggestions
//
//  Created by 杨帆 on 2024/6/20.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    var body: some View {
        TextField("请输入用户名", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle()) // 圆角边框
            .padding()
            .textInputSuggestions {
                ForEach(1 ..< 5, id: \.self) { index in
                    Text("Suggestion \(index)")
                }
            }
    }
}

#Preview {
    ContentView()
}
