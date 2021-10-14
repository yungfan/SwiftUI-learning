//
//  ContentView.swift
//  View10-TextField
//
//  Created by 杨帆 on 2021/10/9.
//

import SwiftUI

struct ContentView: View {
    @State private var str: String = ""

    var body: some View {
        TextField("请输入文本", text: $str)
            .textFieldStyle(.roundedBorder)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("拷贝") {
                    }
                    Button("剪切") {
                    }
                    Button("删除") {
                    }
                    Button("粘贴") {
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
