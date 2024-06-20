//
//  ContentView.swift
//  Modifier-mix
//
//  Created by 杨帆 on 2024/6/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Color.orange
            .mix(with: .white, by: 0.2)
            .frame(width: 300, height: 100)

        Color.orange
            .mix(with: .white, by: 0.5)
            .frame(width: 300, height: 100)

        Color.orange
            .frame(width: 300, height: 100)

        Color.orange
            .mix(with: .black, by: 0.2)
            .frame(width: 300, height: 100)

        Color.orange
            .mix(with: .black, by: 0.5)
            .frame(width: 300, height: 100)
    }
}

#Preview {
    ContentView()
}
