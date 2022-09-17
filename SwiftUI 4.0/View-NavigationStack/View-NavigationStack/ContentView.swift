//
//  ContentView.swift
//  View-NavigationStack
//
//  Created by 杨帆 on 2022/9/15.
//

import SwiftUI

struct ContentView: View {
    @State private var color = Color.teal

    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)

                Text("Hello, world!")
                    .foregroundStyle(color)
            }
            .navigationTitle("NavigationStack")
            .toolbarTitleMenu {
                Button("Red") {
                    color = .red
                }

                Button("Green") {
                    color = .green
                }

                Button("Blue") {
                    color = .blue
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
