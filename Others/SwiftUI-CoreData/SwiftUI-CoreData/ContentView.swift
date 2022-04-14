//
//  ContentView.swift
//  SwiftUI-CoreData
//
//  Created by 杨帆 on 2020/8/3.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(entity: Student.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Student.name, ascending: true)]) var students: FetchedResults<Student>

    @Environment(\.managedObjectContext) var managedObjectContext

    func removeStudent(at offsets: IndexSet) {
        for index in offsets {
            let stu = students[index]
            managedObjectContext.delete(stu)
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(students, id: \.self) { student in
                        HStack {
                            Text(student.name ?? "unknown")
                                .frame(width: 120)
                            
                            Text("\(student.age)")
                                .frame(width: 50)
                            
                            Text(student.sex ?? "unknown")
                        }
                        
                    }.onDelete(perform: removeStudent)
                }

                HStack {
                    Button(action: {
                        let student = Student(context: self.managedObjectContext)
                        student.name = "lisi"
                        student.age = 20
                        student.sex = "male"

                        do {
                            try self.managedObjectContext.save()
                        } catch {
                        }
                    }) {
                        Text("添加学生")
                    }

                    Button(action: {
                        let student = students.first

                        if let student = student {
                            student.name = "zhangsan"
                            student.age = 21
                            student.sex = "female"

                            do {
                                try self.managedObjectContext.save()
                            } catch {
                            }
                        }

                    }) {
                        Text("修改学生")
                    }

                    Button(action: {
                        let student = students.last

                        if let student = student {
                            self.managedObjectContext.delete(student)
                        }

                    }) {
                        Text("删除学生")
                    }
                }
            }
            .navigationTitle("CoreDataDemo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
