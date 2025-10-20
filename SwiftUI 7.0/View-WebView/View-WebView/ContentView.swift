//
//  ContentView.swift
//  View-WebView
//
//  Created by 杨帆 on 2025/8/6.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State var url = URL(string: "https://www.apple.com.cn")

    var body: some View {
        VStack {
            WebView(url: url)
            // 切换URL
            Button("Baidu") {
                url = URL(string: "https://www.baidu.com")
            }
        }
    }
}


#Preview {
    ContentView()
}
