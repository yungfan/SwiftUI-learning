//
//  OrnamentControlView.swift
//  Vision-Ornament
//
//  Created by 杨帆 on 2024/1/9.
//

import SwiftUI

struct OrnamentControlView: View {
    @State var isThumbsup = true
    @State var isThumbsdown = false

    var body: some View {
        VStack {
            HStack {
                Toggle(isOn: $isThumbsup) {
                    Label("", systemImage: "hand.thumbsup.fill")
                }
                .padding(8)

                Toggle(isOn: $isThumbsdown) {
                    Label("", systemImage: "hand.thumbsdown.fill")
                }
                .padding(8)
            }
            .glassBackgroundEffect(in: .rect(cornerRadius: 30))
            .toggleStyle(.button)
            .buttonStyle(.borderless)
            .labelStyle(.iconOnly)
        }
    }
}

#Preview {
    OrnamentControlView()
}
