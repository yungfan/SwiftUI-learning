//
//  ContentView.swift
//  Modifier-onGeometryChange
//
//  Created by 杨帆 on 2024/9/7.
//

import SwiftUI

struct ContentView: View {
    @State private var textFrame = CGRect.zero
    @State private var textSize = 20.0

    var body: some View {
        VStack {
            Text("WWDC24")
                .font(.system(size: textSize))
                .onGeometryChange(for: CGRect.self) { proxy in
                    proxy.frame(in: .global)
                } action: { newValue in
                    textFrame = newValue
                }

            Slider(value: $textSize, in: 10 ... 30)
                .padding()

            Text("Text Width: \(textFrame.width)")

            Text("Text Height: \(textFrame.height)")
        }
    }
}


#Preview {
    ContentView()
}
