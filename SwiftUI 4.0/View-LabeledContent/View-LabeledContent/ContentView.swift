//
//  ContentView.swift
//  View-LabeledContent
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
}

struct ContentView: View {
    
    let person = [
        Person(name: "zhangsan", age: 20),
        Person(name: "lisi", age: 21),
        Person(name: "wangwu", age: 22),
        Person(name: "zhaoliu", age: 23)
    ]
    
    var body: some View {
        List {
            ForEach(person) { person in
                LabeledContent(person.name, value: person.age, format: .number)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
