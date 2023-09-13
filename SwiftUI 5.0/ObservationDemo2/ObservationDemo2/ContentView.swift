//
//  ContentView.swift
//  ObservationDemo2
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
            DetailView()
        }
        .environment(viewModel) // 数据注入到Environment（不再使用.environmentObject），第一个需要使用时注入
    }
}

struct DetailView: View {
    // 获取Environment中的数据（不再使用@EnvironmentObject），Key Path为数据类型.self
    @Environment(ViewModel.self) private var viewModel

    var body: some View {
        List(viewModel.person) { p in
            HStack {
                Text(p.name)
                    .foregroundStyle(.red)

                Spacer()

                Text("\(p.gender ? "male" : "female")")
                    .foregroundStyle(.teal)
            }
        }
    }
}

#Preview {
    // 预览时也需要注入
    DetailView()
        .environment(ViewModel())
}


#Preview {
    ContentView()
}
