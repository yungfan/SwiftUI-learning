//
//  ContentView.swift
//  View-ShareLink
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ShareLink(item: URL(string: "https://yungfan.github.io")!)
            
            ShareLink("自定义标题", item: URL(string: "https://yungfan.github.io")!)
            
            ShareLink(item: URL(string: "https://yungfan.github.io")!) {
                Label("分享", systemImage: "heart")
            }
            
            ShareLink(item: Image(systemName: "heart"), preview: SharePreview("分享图片", image: Image(systemName: "heart")))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
