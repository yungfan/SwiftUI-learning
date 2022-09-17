//
//  ContentView.swift
//  Modifier-Update
//
//  Created by 杨帆 on 2022/9/17.
//

import SwiftUI

// struct ContentView: View {
//    @State private var changeColor = false
//    var body: some View {
//        Text("WWDC Swift")
//            .font(.title)
//            .foregroundColor(changeColor ? .red : .teal)
//            .onTapGesture {
//                withAnimation(.linear(duration: 3.0)) {
//                    changeColor.toggle()
//                }
//            }
//    }
// }

// struct ContentView: View {
//    @State private var changeColor = false
//
//    var body: some View {
//        Text("WWDC Swift")
//            .font(.title)
//            // .foregroundStyle(changeColor ? .red : .teal)
////            .foregroundStyle(changeColor ? .primary : .quaternary)
//            .foregroundStyle(changeColor ? AnyShapeStyle(.blue) : AnyShapeStyle(.quaternary))
//            .onTapGesture {
//                withAnimation(.linear(duration: 3.0)) {
//                    changeColor.toggle()
//                }
//            }
//    }
// }

// struct ContentView: View {
//    @State private var swift = false
//    @State private var iOS = false
//    @State private var swiftUI = false
//    @State private var combine = false
//
//    var body: some View {
//        VStack {
//            HStack {
//                Toggle("#Swift", isOn: $swift)
//                Toggle("#iOS开发", isOn: $iOS)
//            }
//
//            HStack {
//                Toggle("#Combine", isOn: $combine)
//                Toggle("#SwiftUI", isOn: $swiftUI)
//            }
//        }
//        .toggleStyle(.button)
//        .buttonStyle(.bordered)
//    }
// }

//struct ContentView: View {
//    @State private var username = ""
//    @State private var password = ""
//    @State private var show = false
//
//    var body: some View {
//        VStack {
//            HStack {
//                Text("用户名：" + username)
//                Spacer()
//            }
//
//            HStack {
//                Text("密码" + password)
//                Spacer()
//            }
//
//            Button("登录") {
//                show.toggle()
//            }
//            .alert("温馨提示", isPresented: $show) {
//                TextField("输入姓名", text: $username)
//
//                SecureField("输入密码", text: $password)
//
//                Button("取消", role: .cancel) {
//
//                }
//
//                Button("确定") {
//
//                }
//            }
//        }
//        .padding()
//    }
//}


//struct ContentView: View {
//    @FocusState private var focus: String?
//
//    var body: some View {
//        Form {
//            TextField("用户名", text: .constant(""))
//                .focused($focus, equals: "username")
//
//            SecureField("密码", text: .constant(""))
//                .focused($focus, equals: "password")
//        }
//        .onAppear {
//            focus = "username"
//        }
//        .padding()
//    }
//}


struct ContentView: View {
    @State private var names = ["zhangsan", "lisi", "wangwu"]

    var body: some View {
        ScrollView {
            ForEach(names, id:\.self) { name in
                Text(name)
                    .font(.title)
                    .foregroundColor(.teal)
                    .padding()
            }
        }
        .refreshable {
            // names += ["zhaoliu"]
            await loadMore()
        }
    }
    
    func loadMore() async {
        try? await Task.sleep(until: .now + .seconds(3), clock: .continuous)
        names.insert("YungFan", at: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
