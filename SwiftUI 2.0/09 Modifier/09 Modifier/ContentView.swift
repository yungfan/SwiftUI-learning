//
//  ContentView.swift
//  09 Modifier
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI

//struct ItemView: View {
//    var body: some View {
//        HStack {
//            Image(systemName: "person.fill")
//                .resizable()
//                .frame(width: 40, height: 40)
//                .foregroundColor(.green)
//
//            Spacer()
//
//            Text("张三")
//                .foregroundColor(.secondary)
//                .bold()
//                .font(.title)
//
//            Spacer()
//
//            Text("安徽怀宁")
//                .foregroundColor(.primary)
//                .font(.title)
//        }
//    }
//}
//
//struct ContentView: View {
//    @State private var show = false
//
//    @Namespace var namespace
//
//    var body: some View {
//        ZStack {
//            VStack {
//                ItemView()
//                    .matchedGeometryEffect(id: "test", in: namespace, isSource: !show)
//                    .padding()
//                    .background(Color.purple)
//
//            }.matchedGeometryEffect(id: "test2", in: namespace, isSource: !show)
//
//
//            if show {
//                VStack {
//                    ScrollView {
//                        ItemView()
//                            .matchedGeometryEffect(id: "test", in: namespace)
//
//                        Text("这是我的同学，男，安徽怀宁人，1990年生，大学教师，现工作在某高校计算机学院移动应用开发专业，从事 iOS 教学的工作。")
//                            .font(.system(size: 20))
//                            .padding(.top, 30)
//                            .foregroundColor(.white)
//
//                        Text("这是我的同学，男，安徽怀宁人，1990年生，大学教师，现工作在某高校计算机学院移动应用开发专业，从事 iOS 教学的工作。")
//                            .font(.system(size: 20))
//                            .padding(.top, 30)
//                            .foregroundColor(.white)
//
//                        Text("这是我的同学，男，安徽怀宁人，1990年生，大学教师，现工作在某高校计算机学院移动应用开发专业，从事 iOS 教学的工作。")
//                            .font(.system(size: 20))
//                            .padding(.top, 30)
//                            .foregroundColor(.white)
//                    }.padding()
//                }
//                .matchedGeometryEffect(id: "test2", in: namespace)
//                .background(Color.orange)
//
//            }
//
//        }.onTapGesture {
//            withAnimation {
//            show.toggle()
//            }
//        }
//    }
//}

 struct ContentView: View {

    @State private var show = false

    @Namespace var namespace

    var body: some View {

        ZStack {

            Circle()
                .fill(Color.red)
                .matchedGeometryEffect(id: "test", in: namespace)
                .frame(width: 100, height: 100)


            if show {
                Circle()
                    .fill(Color.blue)
                    .matchedGeometryEffect(id: "test", in: namespace)
                    .frame(width: 300, height: 300)

            }
        }.onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
            withAnimation {
            show.toggle()
            }
        })

    }
 }

// struct ContentView: View {
//
//    @State private var show = false
//
//    @Namespace var namespace
//
//    var body: some View {
//
//        ZStack {
//
//            Image("img")
//                .resizable()
//                .matchedGeometryEffect(id: "test", in: namespace)
//                .frame(width: 100, height: 100)
//
//
//            if show {
//                ScrollView {
//                    Image("img")
//                        .resizable()
//                        .matchedGeometryEffect(id: "test", in: namespace)
//                        .frame(width: 300, height: 300)
//
//                }
//
//                TextEditor(text: .constant("在两个不同位置、大小的 View 之间实现过渡效果。需要使用@Namespace为 View 创建一个全局命名空间。使用matchedGeometryEffect修饰想产生动画的 View 。id：主要用于 View 分组。namespace：为了避免 id 碰撞，两个 View 的配对是由id+namespace决定。 property：是否要匹配大小(.size)、位置(.position)或两者都匹配(.frame)。如果没有指定将同时匹配。"))
//                    .frame(width: 300, height: 300)
//            }
//        }.onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
//            withAnimation {
//                show.toggle()
//            }
//        })
//
//    }
// }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
