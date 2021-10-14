//
//  ContentView.swift
//  Shared
//
//  Created by 杨帆 on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
        #if os(iOS)
            .foregroundColor(.red)
            .font(.title)
        #elseif os(macOS)
            .foregroundColor(.green)
            .font(.largeTitle)
        #else
            .foregroundColor(.blue)
            .font(.title3)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
