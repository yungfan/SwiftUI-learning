//
//  ContentView.swift
//  Modifier-scrollContentBackground
//
//  Created by 杨帆 on 2022/9/16.
//

import SwiftUI

struct ContentView: View {
    @State private var comment = "请输入内容"

    var body: some View {
        TextEditor(text: $comment)
            .scrollContentBackground(.hidden)
            .background(RoundedRectangle(cornerRadius: 15).fill(.teal))
            .padding()

        List(0 ..< 20) {
            Text("Row \($0)")
        }
        .scrollContentBackground(.hidden)
        .background(
            Image(systemName: "person.2")
                .resizable()
                .ignoresSafeArea()
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
