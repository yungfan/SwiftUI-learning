//
//  ContentView.swift
//  View07-Color
//
//  Created by 杨帆 on 2021/10/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Circle()
            .fill(.mint)

        Circle()
            .fill(.teal)

        Circle()
            .fill(.cyan)

        Circle()
            .fill(.indigo)

        Circle()
            .fill(.brown)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
