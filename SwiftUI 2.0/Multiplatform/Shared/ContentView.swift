//
//  ContentView.swift
//  Shared
//
//  Created by 杨帆 on 2021/3/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        #if os(macOS)
            // Mac
            MacSidebarView()
                .frame(minWidth: 900, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity)
        #else
            if UIDevice.current.userInterfaceIdiom == .pad {
                // iPad
                IPadSidebarView()
            } else {
                // iPhone
                TabbarView()
            }
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
