//
//  WelcomeView.swift
//  Window
//
//  Created by 杨帆 on 2022/4/17.
//

import SwiftUI

struct WelcomeView: View {
    let screenSize = NSScreen.main?.frame.size ?? CGSize(width: 800, height: 600) // 全屏显示

    var body: some View {
        NavigationView {
            ZStack {
                Color.orange

                Text("主界面")
            }
            .navigationTitle("Window")

            Text("Hello, world!")
                .padding()
        }
        .frame(width: screenSize.width, height: screenSize.height)
    }
}
