//
//  ContentView.swift
//  Modifier-navigationTransition
//
//  Created by 杨帆 on 2024/9/7.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var namespace
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                // 目标View，使用navigationTransition修饰符
                Text("Detail View")
                    .navigationTitle("Detail")
                    .navigationTransition(.zoom(sourceID: "zoom", in: namespace)) // 参数与源View保持一致
            } label: {
                // 源View，使用matchedTransitionSource修饰符
                Text("Main View")
                    .matchedTransitionSource(id: "zoom", in: namespace)
            }
            .navigationTitle("Main")
        }
    }
}


#Preview {
    ContentView()
}
