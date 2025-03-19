//
//  ContentView.swift
//  TouchIndicator
//
//  Created by 杨帆 on 2025/3/19.
//

import SwiftUI

struct ContentView: View {
    // 选择器的索引
    @State private var index: Int = 0
    // 选择器的数据源
    let dataSource = ["赤", "橙", "黄", "绿", "青", "蓝", "紫"]

    var body: some View {
        VStack {
            // 创建选择器
            Picker(selection: $index, label: Text("选择颜色")) {
                ForEach(0 ..< dataSource.count, id: \.self) {
                    Text(self.dataSource[$0])
                }
            }
            .padding()

            // 显示选中的结果
            Text(dataSource[index])
        }
    }
}

#Preview {
    ContentView()
}
