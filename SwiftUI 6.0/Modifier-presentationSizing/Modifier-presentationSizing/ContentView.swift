//
//  ContentView.swift
//  Modifier-presentationSizing
//
//  Created by 杨帆 on 2024/9/7.
//

import SwiftUI

struct ContentView: View {
    @State private var isModal = false

    var body: some View {
        Button("Modal") {
            isModal = true
        }
        .sheet(isPresented: $isModal) {
            ZStack {
                Color.orange

                Button("Dismiss") {
                    isModal = false
                }
            }
            // .presentationSizing(.form)
            // .presentationSizing(.page)
            .presentationSizing(.fitted)
        }
    }
}


#Preview {
    ContentView()
}
