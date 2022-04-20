//
//  ContentView.swift
//  Transparent
//
//  Created by 杨帆 on 2022/4/20.
//

import SwiftUI

struct ContentView: View {
    @State private var changeCackgroundColor = true

    var body: some View {
        VStack {
            Button {
                changeCackgroundColor.toggle()
            } label: {
                Text("Hello, world!")
            }
        }
        .padding()
        .frame(width: 300, height: 300)
        .background(changeCackgroundColor ? .black.opacity(0.2) : .red.opacity(0.1))
        .onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
            setWindow()
        })
    }

    func setWindow() {
        // 隐藏左上角的三个按钮
        NSApp.mainWindow?.standardWindowButton(.zoomButton)?.isHidden = true
        // NSApp.mainWindow?.standardWindowButton(.closeButton)?.isHidden = true
        NSApp.mainWindow?.standardWindowButton(.miniaturizeButton)?.isHidden = true
        // 背景透明
        NSApp.mainWindow?.backgroundColor = NSColor.black
        NSApp.mainWindow?.backgroundColor = NSColor(calibratedHue: 0, saturation: 0, brightness: 0, alpha: 0.2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
