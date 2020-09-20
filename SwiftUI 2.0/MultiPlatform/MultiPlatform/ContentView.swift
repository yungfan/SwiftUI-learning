//
//  ContentView.swift
//  MultiPlatform
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI

struct ContentView: View {
    #if os(iOS)
        @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif

    var body: some View {
        #if os(iOS)
            if horizontalSizeClass == .compact {
                // iOS
                Color.red
            } else {
                // iPadOS
                Color.blue
            }

        #else
            // macOS
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
