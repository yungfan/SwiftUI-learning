//
//  ContentView.swift
//  Table
//
//  Created by 杨帆 on 2022/4/15.
//

import SwiftUI

struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let age: String
    let stuClass: String
}

struct ContentView: View {
    @State private var students = [
        Student(name: "张三", sex: "男", age: "10", stuClass: "软件开发111"),
        Student(name: "李四", sex: "女", age: "20", stuClass: "软件开发222"),
        Student(name: "王五", sex: "男", age: "30", stuClass: "软件开发111"),
        Student(name: "赵六", sex: "女", age: "40", stuClass: "软件开发222"),
    ]
    // 选中
    @State private var selectedStudent = Set<Student.ID>()
    // 排序
    @State private var sortOrder = [KeyPathComparator(\Student.age)]

    var body: some View {
        // 可选中，可排序
        Table(students, selection: $selectedStudent, sortOrder: $sortOrder) {
            TableColumn("姓名", value: \.name)
            TableColumn("性别", value: \.sex)
            TableColumn("年龄", value: \.age)
            TableColumn("班级", value: \.stuClass)
        }
        .onChange(of: sortOrder) {
            students.sort(using: $0) // 排序
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
