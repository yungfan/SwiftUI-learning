//
//  ContentView.swift
//  ObservationDemo
//
//  Created by 杨帆 on 2023/9/13.
//

import Observation
import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    var name = ""
    var gender = false
}

@Observable
class ViewModel {
    var person: [Person] = []

    func loadPerson() {
        person = [Person(name: "zhangsan", gender: true),
                  Person(name: "lisi"),
                  Person(name: "wangwu")]
    }

    func removePerson(_ index: Int) {
        person.remove(at: index)
    }

    func addPerson(_ p: Person) {
        person.insert(p, at: 0)
    }
}

struct ContentView: View {
    @State private var viewModel = ViewModel()
    @State private var show = false

    var body: some View {
        VStack {
            Text("Observation")

            Button("显示详情") {
                show.toggle()
            }
        }
        .onAppear {
            viewModel.loadPerson()
        }
        .sheet(isPresented: $show) {
            DetailView(viewModel: viewModel)
        }
    }
}

struct DetailView: View {
    @Bindable var viewModel: ViewModel // 绑定ViewModel

    var body: some View {
        VStack {
            List {
                ForEach($viewModel.person) { $p in
                    HStack {
                        Text(p.name)
                            .foregroundStyle(.red)

                        Text("\(p.gender ? "male" : "female")")
                            .foregroundStyle(.teal)

                        TextField("", text: $p.name)
                            .textFieldStyle(.roundedBorder)

                        Toggle(isOn: $p.gender) {
                        }
                    }
                }
                .onDelete { index in
                    viewModel.removePerson(index.first!)
                }
            }

            Button {
                viewModel.addPerson(Person(name: "zhaoliu", gender: true))
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}


#Preview {
    ContentView()
}
