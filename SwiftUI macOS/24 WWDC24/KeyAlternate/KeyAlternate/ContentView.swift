//
//  ContentView.swift
//  KeyAlternate
//
//  Created by 杨帆 on 2024/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Regular Button") {
            print("Regular button")
        }
        .modifierKeyAlternate([.option]) {
            Button("Option + Button") {
                print("option + button")
            }
        }
        .modifierKeyAlternate([.command, .option]) {
            Button("Command + Option + Button") {
                print("Command + Option + button")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
