//
//  FloatWindow.swift
//  FloatWindow
//
//  Created by 杨帆 on 2025/1/11.
//

import SwiftUI

struct FloatWindow: View {
    @State private var isHovered: Bool = false
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        Image("yf")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300)
            .clipShape(.rect(cornerRadius: 30))
            .overlay() {
                Rectangle()
                    .fill(Color.black.opacity(0.2))
                    .overlay(alignment: .topTrailing) {
                        Button {
                            dismissWindow()
                        } label: {
                            Image(systemName: "xmark.circle")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        }
                        .buttonStyle(.plain)
                        .offset(x: -10, y: 10)
                    }
                    .opacity(isHovered ? 1 : 0)
                    .animation(.smooth, value: isHovered)
            }
            .onHover {
                isHovered = $0
            }
            .clipShape(.rect(cornerRadius: 30))
    }
}

#Preview {
    ContentView()
}
