//
//  ContentView.swift
//  View-Toggle
//
//  Created by 杨帆 on 2022/9/16.
//

import SwiftUI

struct Settings: Identifiable {
    var id = UUID()
    var open: Bool
    var name: String

    static var data: [Settings] = [
        .init(open: true, name: "A"),
        .init(open: false, name: "B"),
        .init(open: true, name: "C"),
        .init(open: false, name: "D"),
        .init(open: true, name: "E"),
    ]
}

struct ContentView: View {
    @State private var data = Settings.data

    var body: some View {
        VStack {
            ForEach($data) { item in
                Toggle(isOn: item.open) {
                    Text(item.wrappedValue.name)
                }
            }

            Toggle(sources: $data, isOn: \.open) {
                Text("控制全部")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
