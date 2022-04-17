//
//  WelcomeView.swift
//  Window
//
//  Created by 杨帆 on 2022/4/17.
//

import SwiftUI

struct WelcomeView: View {
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
        .frame(minWidth: 700,
               idealWidth: 1000,
               maxWidth: .infinity,
               minHeight: 400,
               idealHeight: 800,
               maxHeight: .infinity)
    }
}
