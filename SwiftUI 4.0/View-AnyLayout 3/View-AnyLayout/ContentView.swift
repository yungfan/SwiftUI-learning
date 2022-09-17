//
//  ContentView.swift
//  View-AnyLayout
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

enum Custom: String, CaseIterable, Identifiable {
    case vstack = "vstack"
    case hstack = "hstack"

    var id: Self { self }

    var layout: any Layout {
        switch self {
        case .vstack: return VStackLayout()
        case .hstack: return HStackLayout()
        }
    }
}

struct ContentView: View {
    @State private var custom = Custom.hstack
    let colors: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]

    var body: some View {
        VStack {
            Picker("切换布局", selection: $custom) {
                ForEach(Custom.allCases) { layout in
                    Text("\(layout.rawValue)")
                }
            }
            .pickerStyle(.segmented)

            AnyLayout(custom.layout) {
                ForEach(colors, id: \.self) { color in
                    Rectangle()
                        .fill(color)
                }
            }
            .animation(.default, value: custom)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
