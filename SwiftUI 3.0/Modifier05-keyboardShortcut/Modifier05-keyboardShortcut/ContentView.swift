//
//  ContentView.swift
//  Modifier05-keyboardShortcut
//
//  Created by 杨帆 on 2021/10/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("CMD+C") {
            print("CMD+C")
        }
        .keyboardShortcut("C", modifiers: [.command, .option])
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
