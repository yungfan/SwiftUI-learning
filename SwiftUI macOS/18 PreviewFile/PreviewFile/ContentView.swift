//
//  ContentView.swift
//  PreviewFile
//
//  Created by 杨帆 on 2022/4/18.
//

import QuickLook
import SwiftUI

struct ContentView: View {
    @State var pdfURL: URL?
    var body: some View {
        VStack {
            Button(action: {
                pdfURL = Bundle.main.url(forResource: "AI", withExtension: "pdf")
            }) {
                Text("人工智能")
            }
            .help("点击按钮可以预览pdf文件") // 鼠标移动到按钮时的提示文字
            .quickLookPreview($pdfURL) // 预览
        }
        .frame(width: 600, height: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
