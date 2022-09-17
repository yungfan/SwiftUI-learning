//
//  ContentView.swift
//  View-ScrollView
//
//  Created by 杨帆 on 2022/9/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            
            TextField("请输入内容", text: .constant("zhangsan"))
                .textFieldStyle(.roundedBorder)
            
            Color.orange
                .frame(width: UIScreen.main.bounds.width, height: 2000)
            
            Text("尾部")
        }
        .scrollDismissesKeyboard(.interactively)
        //.scrollDisabled(true)
        //.scrollIndicators(.hidden)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
