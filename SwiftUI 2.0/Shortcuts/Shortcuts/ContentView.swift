//
//  ContentView.swift
//  Shortcuts
//
//  Created by 杨帆 on 2021/3/27.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var shortcutSettings: ShortcutSettings

    var body: some View {
        ZStack {
            // 根据类型进行不同的处理
            if let shortcutType = shortcutSettings.shortcutType {
                switch shortcutType {
                case .scan:
                    Color.red
                case .favorite:
                    Color.blue
                }
            }

            Text("主屏交互")
                .font(.title)
                .padding()
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
