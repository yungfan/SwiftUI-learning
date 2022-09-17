//
//  ContentView.swift
//  View-TextEditor
//
//  Created by 杨帆 on 2022/9/15.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""
    @State private var showFindUI = false
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $text)
                .findNavigator(isPresented: $showFindUI)
                .padding()
                .navigationTitle("查找与替换")
                .toolbar {
                    Toggle(isOn: $showFindUI) {
                        Label("Find", systemImage: "magnifyingglass")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
