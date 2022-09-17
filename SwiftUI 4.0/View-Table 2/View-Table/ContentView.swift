//
//  ContentView.swift
//  View-Table
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

struct Student: Identifiable {
    let id = UUID()
    var no: String
    var name: String
    var age: String
    var sex: String
}

struct ContentView: View {
    @State private var students = [
        Student(no: "123456781", name: "张三", age: "20", sex: "男"),
        Student(no: "123456782", name: "李四", age: "21", sex: "女"),
        Student(no: "123456783", name: "王五", age: "22", sex: "男"),
        Student(no: "123456784", name: "赵六", age: "23", sex: "女")]

    @State private var selection: Set<Student.ID> = []
    @State private var sortOrder = [KeyPathComparator(\Student.no, order: .reverse), KeyPathComparator(\Student.age, order: .reverse)]

    var body: some View {
        Table(selection: $selection, sortOrder: $sortOrder) {
            TableColumn("学号", value: \.no)
            TableColumn("姓名", value: \.name)
            TableColumn("年龄", value: \.age)
            TableColumn("性别", value: \.sex)
        } rows: {
            TableRow(Student(no: "0000000", name: "首行", age: "0", sex: "男"))

            ForEach(students) { student in
                TableRow(student)
            }

            TableRow(Student(no: "1000000", name: "尾行", age: "100", sex: "女"))
        }
        .onChange(of: sortOrder) { newValue in
            withAnimation {
                students.sort(using: newValue)
            }
        }
        .onChange(of: selection) { newValue in
            newValue.forEach { id in
                print(students.filter { $0.id == id }.first)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
