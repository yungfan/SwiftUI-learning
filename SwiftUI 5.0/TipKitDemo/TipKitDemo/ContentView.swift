//
//  ContentView.swift
//  TipKitDemo
//
//  Created by 杨帆 on 2023/9/13.
//

import SwiftUI
import TipKit

// MARK: - 自定义Tip
struct InfoTip: Tip {
    var title: Text {
        Text("信息提示")
    }

    var message: Text? {
        Text("该数字用于计数")
    }

    var image: Image? {
        Image(systemName: "n.circle")
    }
}

struct OperationTip: Tip {
    var title: Text {
        Text("操作提示")
            .foregroundStyle(.red)
            .font(.title2)
            .fontDesign(.serif)
            .bold()
    }

    var message: Text? {
        Text("通过“+”与“-”对数值进行更新")
            .foregroundStyle(.white)
            .font(.title3)
            .fontDesign(.monospaced)
    }

    var image: Image? {
        Image(systemName: "info.bubble")
    }
}

struct ContentView: View {
    @State private var count = 0
    private var infoTip = InfoTip()

    var body: some View {
        NavigationView {
            VStack {
                // TipView，显示Tip
                TipView(infoTip)
                    .tipBackground(.purple) // 背景
                    .tipCornerRadius(10) // 圆角
                    .tipImageSize(CGSize(width: 100, height: 100)) // 图片大小
                    .tipViewStyle(.miniTip) // 样式
                    .tint(.orange) // 图片颜色
                    .foregroundStyle(.white) // 关闭按钮颜色

                Text(count.formatted())
                    .font(.title)

                HStack(spacing: 20) {
                    Button {
                        count += 1
                    } label: {
                        Text("+")
                    }

                    Button {
                        count -= 1
                    } label: {
                        Text("-")
                    }
                }
                .font(.largeTitle)

                // TipView，显示Tip与箭头位置
                TipView(OperationTip(), arrowEdge: .top)
                    .tipBackground(.teal)
                    .tint(.red)
                    .foregroundStyle(.black)
            }
            .padding()
            .task {
                try? Tips.configure([
                    // 显示频率
                    .displayFrequency(.daily),
                    // 数据存储位置
                    .datastoreLocation(.applicationDefault)
                ])
            }
        }
    }
}


#Preview {
    ContentView()
}
