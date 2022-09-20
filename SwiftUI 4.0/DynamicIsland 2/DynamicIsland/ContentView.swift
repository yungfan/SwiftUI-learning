//
//  ContentView.swift
//  DynamicIsland
//
//  Created by 杨帆 on 2022/9/20.
//

import SwiftUI

enum DynamicIslandViewAlignment {
    case top, trailing, bottom, leading
}

struct DynamicIslandView<Content: View>: View {
    private var alignment: DynamicIslandViewAlignment
    private var content: () -> Content

    init(alignment: DynamicIslandViewAlignment, content: @escaping () -> Content) {
        self.alignment = alignment
        self.content = content
    }

    var body: some View {
        switch alignment {
        case .top:
            content()
                .position(x: UIScreen.main.bounds.midX, y: 11 * 0.5)
                .edgesIgnoringSafeArea(.top)
        case .trailing:
            content()
                .position(x: UIScreen.main.bounds.width * 2 / 3 + 5, y: 59 * 0.5)
                .edgesIgnoringSafeArea(.top)
        case .bottom:
            content()
                .position(x: UIScreen.main.bounds.midX, y: 59 - 6)
                .edgesIgnoringSafeArea(.top)
        case .leading:
            content()
                .position(x: UIScreen.main.bounds.width / 3 - 5, y: 59 * 0.5)
                .edgesIgnoringSafeArea(.top)
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            DynamicIslandView(alignment: .top) {
                Image(systemName: "figure.outdoor.cycle")
                    .foregroundStyle(.red)
            }

            DynamicIslandView(alignment: .trailing) {
                Image(systemName: "figure.outdoor.cycle")
                    .foregroundStyle(.red)
            }

            DynamicIslandView(alignment: .bottom) {
                Image(systemName: "figure.outdoor.cycle")
                    .foregroundStyle(.red)
            }

            DynamicIslandView(alignment: .leading) {
                Image(systemName: "figure.outdoor.cycle")
                    .foregroundStyle(.red)
            }
        }
        .font(.system(size: 11))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
