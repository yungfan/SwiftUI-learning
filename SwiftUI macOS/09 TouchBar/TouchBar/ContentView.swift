//
//  ContentView.swift
//  TouchBar
//
//  Created by 杨帆 on 2022/4/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .focusable()
            .touchBar { // 设置TouchBar
                Button {
                    print("点击了TouchBar的按钮1")
                } label: {
                    Image(systemName: "star.fill")
                }

                Button {
                    print("点击了TouchBar的按钮2")
                } label: {
                    Image(systemName: "signature")
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
