//
//  ContentView.swift
//  MenuBar
//
//  Created by 杨帆 on 2022/4/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("退出") {
                NSApplication.shared.terminate(nil)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
