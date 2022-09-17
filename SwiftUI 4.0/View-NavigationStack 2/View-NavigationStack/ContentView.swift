//
//  ContentView.swift
//  View-NavigationStack
//
//  Created by 杨帆 on 2022/9/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0 ..< 30) {
                Text("Row \($0)")
            }
            .navigationTitle("标题")
            .toolbarBackground(Color.teal, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
