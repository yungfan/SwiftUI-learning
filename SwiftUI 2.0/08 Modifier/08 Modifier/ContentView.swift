//
//  ContentView.swift
//  08 Modifier
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI

// struct ContentView: View {
//    @State private var input: String = ""
//    @State private var clear: Bool = false
//
//    var body: some View {
//        HStack {
//            TextField("", text: $input)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .onChange(of: input, perform: { value in
//                    print(value)
//                })
//                .onChange(of: clear, perform: { value in
//                    //if value {
//                        input = ""
//                    //}
//                })
//
//            Button("清除") {
//                clear.toggle()
//            }
//        }.padding()
//    }
// }

struct Student: Identifiable {
    var id = UUID()
    var name: String
}

struct ContentView: View {
    @State var stus = Array(repeating: Student(name: "张三"), count: 20)

    @State var stuID: UUID?

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach(stus) { stu in
                        Text(stu.name)
                            .foregroundColor(.white)
                            .padding(16)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.purple))
                            .id(stu.id)
                    }
                }.onChange(of: stuID) { value in
                    withAnimation {
                        proxy.scrollTo(value)
                    }
                }
            }

            HStack {
                Button("追加") {
                    let stu = Student(name: "李四")
                    stus.append(stu)
                    stuID = stu.id
                }

                Button("插入") {
                    let stu = Student(name: "王五")
                    stus.insert(stu, at: 0)
                    stuID = stu.id
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
