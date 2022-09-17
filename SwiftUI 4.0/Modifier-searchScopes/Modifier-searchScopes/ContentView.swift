//
//  ContentView.swift
//  Modifier-searchScopes
//
//  Created by 杨帆 on 2022/9/17.
//

import SwiftUI

enum PersonScope: String, CaseIterable {
    case student, teacher
}

struct Person: Identifiable {
    var id = UUID()
    var name: String
    var type: PersonScope

    static var person: [Person] = [
        .init(name: "ZhangSan", type: .teacher),
        .init(name: "LiSi", type: .student),
        .init(name: "WangWu", type: .teacher),
        .init(name: "ZhaoLiu", type: .student)]
}

struct ContentView: View {
    @State private var queryString = ""
    @State private var filterPerson = Person.person
    
    var filterNames: [String] {
        if queryString.isEmpty {
            return filterPerson.map(\.name)
        } else {
            return filterPerson.map(\.name).filter { $0.localizedCaseInsensitiveContains(queryString) }
        }
    }

    @State private var scope = PersonScope.student

    var body: some View {
        NavigationStack {
            List(filterNames, id: \.self) { name in
                Text(name)
            }
            .navigationTitle("搜索")
        }
        .searchable(text: $queryString, prompt: "输入关键字")
        .searchScopes($scope) {
            ForEach(PersonScope.allCases, id: \.self) { scope in
                CellView(content: scope.rawValue, filterPerson: $filterPerson)
            }
        }
        .onChange(of: scope) { newValue in
            filterPerson = Person.person.filter {
                $0.type == newValue
            }
        }
    }
}

struct CellView: View {
    var content: String
    @Environment(\.isSearching) var isSearching
    @Binding var filterPerson: [Person]
    
    var body: some View {
        Text(content)
            .onChange(of: isSearching) { newValue in
                if !newValue {
                    filterPerson = Person.person
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
