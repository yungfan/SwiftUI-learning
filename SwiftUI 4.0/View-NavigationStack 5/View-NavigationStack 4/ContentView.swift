//
//  ContentView.swift
//  View-NavigationStack 4
//
//  Created by 杨帆 on 2022/9/15.
//

import SwiftUI

struct Student: Identifiable, Hashable {
    var id: Self { self }
    var name: String
}

struct ContentView: View {
    @State private var students: [Student] = [.init(name: "zhangsan"), .init(name: "lisi")]
    @State private var path = NavigationPath()

    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                List {
                    ForEach(students) { student in
                        NavigationLink(student.name, value: student)
                    }
                }
                .navigationTitle("Names")
                .navigationDestination(for: Student.self) { student in
                    Text(student.name)
                        .navigationTitle("姓名")
                        .foregroundStyle(.red)
                }
            }

            HStack {
                Button("跳转") {
                    path.append(Student(name: "王五"))
                }

                Button("返回") {
                    path.removeLast()
                }
                .disabled(path.count == 0)

                Button("返回Root") {
                    path.removeLast(path.count)
                }
                .disabled(path.count == 0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
