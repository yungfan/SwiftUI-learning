//
//  ContentView.swift
//  04 View
//
//  Created by 杨帆 on 2020/9/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Label("系统图片", systemImage: "pencil")

            // Label("自己图片", image:"img")

            Label(
                title: { Text("自己图片") },
                icon: { RoundedRectangle(cornerRadius: 5).fill(Color.purple).frame(width: 20, height: 20) }
            )
            
            Link("百度", destination: URL(string: "https://www.baidu.com")!)
            
            Link(destination: URL(string: "https://www.baidu.com")!) {
                Image(systemName: "link")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
