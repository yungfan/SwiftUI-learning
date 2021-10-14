//
//  ContentView.swift
//  View15-Menu
//
//  Created by 杨帆 on 2021/10/10.
//

import SwiftUI

struct ContentView: View {
    @State private var bgColor = Color.orange
    
    var body: some View {
        ZStack {
            bgColor
            
            Menu {
                Button("红") {
                    bgColor = .red
                }
                
                Button("绿") {
                    bgColor = .green
                }
                
                Button("蓝") {
                    bgColor = .blue
                }
            } label: {
                Label("菜单", systemImage: "heart")
            } primaryAction: {
                bgColor = .brown
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
