//
//  ContentView.swift
//  NewWindowApp
//
//  Created by 杨帆 on 2022/6/17.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openWindow) var openWindow

    var body: some View {
        Text("Main Window")
            .toolbar {
                Button {
                    openWindow(id: "new_window") // 打开id为new_window的Window
                } label: {
                    Image(systemName: "plus")
                }

                Button {
                    openWindow(id: "new_windowgroup") // 打开id为new_windowgroup的WindowGroup
                } label: {
                    Image(systemName: "plus.square.on.square")
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
