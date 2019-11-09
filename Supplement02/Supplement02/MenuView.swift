//
//  MenuView.swift
//  Supplement02
//
//  Created by 杨帆 on 2019/11/9.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var showingMenuView: Bool
    // 根据次数判断是不是返回
    @State private var count: Int = 0
    
    var body: some View {
        GeometryReader { _ in
            // 顶部箭头
            Image(systemName: "triangle.fill")
                .resizable()
                .frame(width:20, height: 20) // 固定一下三角形的大小，尤其是高度
                .foregroundColor(.red)
                .padding(.leading, 20)
            
            
            VStack(alignment: .leading) {
                
                Group {
                    MenuItem(itemName: "笔记", itemImageName: "square.and.pencil")
                    MenuItem(itemName: "通知", itemImageName: "bell")
                    MenuItem(itemName: "收藏", itemImageName: "heart")
                    MenuItem(itemName: "设置", itemImageName: "gear")
                }.frame(maxWidth: 100) //设置最大宽度
                
            }
                
            .background(
                RoundedRectangle(cornerRadius: 5).foregroundColor(.red)
            ).padding(.top, 10) // 根据三角形的高度设置padding，看上去是一个组件
        }.onAppear(perform: { // 第二次进入即返回的时候，菜单关闭，需要重新打开
            if self.count > 0 {
                self.showingMenuView.toggle()
            }
            self.count += 1
        })
        .padding(.leading, 5) // 距离屏幕边缘有一点距离
    }
}

