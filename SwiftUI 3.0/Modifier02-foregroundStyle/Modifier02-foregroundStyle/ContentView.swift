//
//  ContentView.swift
//  Modifier02-foregroundStyle
//
//  Created by 杨帆 on 2021/10/11.
//

import SwiftUI

struct ContentView: View {
    @State private var isShow = false

    var body: some View {
        Group {
            Text("Hello, world!")
                .padding()
                .foregroundStyle(.red)

            Text("Hello, world!")
                .padding()
                .foregroundStyle(.primary)

            Text("Hello, world!")
                .padding()
                .foregroundStyle(.secondary)

            Text("Hello, world!")
                .padding()
                .foregroundStyle(.tertiary)

            Text("Hello, world!")
                .padding()
                .foregroundStyle(.quaternary)

            Text("Hello, world!")
                .padding()
                .foregroundStyle(LinearGradient(colors: [.orange, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
        }

        Button("切换样式") {
            isShow.toggle()
        }
        
        Text("SwiftUI 3.0")
            .foregroundStyle(isShow ? AnyShapeStyle(Color.red) : AnyShapeStyle(LinearGradient(colors: [.orange, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
