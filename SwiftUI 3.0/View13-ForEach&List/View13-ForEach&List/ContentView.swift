//
//  ContentView.swift
//  View13-ForEach&List
//
//  Created by 杨帆 on 2021/10/10.
//

import SwiftUI
struct Person: Identifiable {
    let id = UUID()
    var name = ""
    var gender = false
}

struct ContentView: View {
    @State var person = [Person(name: "zhangsan", gender: true), Person(name: "lisi", gender: false), Person(name: "wangwu", gender: true)]

    var body: some View {
        List($person) { $p in
            DetailView(name: $p.name, gender: $p.gender)
        }
    }
}

struct DetailView: View {
    @Binding var name: String
    @Binding var gender: Bool

    var body: some View {
        HStack {
            Text(name)

            TextField("", text: $name)
                .textFieldStyle(.roundedBorder)

            Toggle("", isOn: $gender)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
