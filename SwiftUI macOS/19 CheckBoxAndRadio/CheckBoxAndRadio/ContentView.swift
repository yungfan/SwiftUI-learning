//
//  ContentView.swift
//  CheckBoxAndRadio
//
//  Created by 杨帆 on 2022/4/19.
//

import SwiftUI

struct ContentView: View {
    // 单选索引
    @State private var index: Int = 0
    let dataSource = ["赤", "橙", "黄", "绿", "青", "蓝", "紫"]
    let colors: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
    // 多选初始状态
    @State private var checks: [Bool] = [false, false, false, true, false, true, false]

    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()

            // 单选实现：Picker+RadioGroupPickerStyle
            Picker(selection: $index, label: Text("选择颜色")) {
                ForEach(0 ..< dataSource.count, id: \.self) {
                    Text(self.dataSource[$0])
                }
            }
            .pickerStyle(.radioGroup)
            .padding()
            .navigationTitle("单选与多选")

            ZStack {
                colors[index]

                // 多选实现：Toggle+CheckboxToggleStyle
                VStack {
                    ForEach(0 ..< dataSource.count, id: \.self) {
                        Toggle(dataSource[$0], isOn: $checks[$0])
                            .toggleStyle(.checkbox)
                    }
                }
            }
        }
        .frame(minWidth: 800,
               idealWidth: 1200,
               maxWidth: .infinity,
               minHeight: 400,
               idealHeight: 800,
               maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
