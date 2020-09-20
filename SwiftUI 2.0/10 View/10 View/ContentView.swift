//
//  ContentView.swift
//  10 View
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI

//struct ContentView: View {
//    let columns = [GridItem(.fixed(30)), GridItem(.flexible(minimum: 60)), GridItem(.adaptive(minimum: 100))]
//
//    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: columns, pinnedViews: [.sectionHeaders]) {
//                Section(header: Text("Section A")) {
//                    ForEach(0 ..< 50) { index in
//                        Rectangle()
//                            .fill(Color.blue)
//                            .frame(height: 30)
//                            .overlay(Text("\(index)"))
//                            .id(UUID())
//                    }
//                }
//
//                Section(header: Text("Section B")) {
//                    ForEach(50 ..< 150) { index in
//                        Rectangle()
//                            .fill(Color.blue)
//                            .frame(height: 30)
//                            .overlay(Text("\(index)"))
//                            .id(UUID())
//                    }
//                }
//            }
//        }
//    }
//}

struct ContentView: View {
    
    var body: some View {
        // 一定要水平滚动
        ScrollView(.horizontal) {
            // 通过count很容易控制行数
            // 此时的GridItem决定的是高度
            LazyHGrid(rows: Array(repeating: GridItem(.fixed(100)), count: 8), spacing: 10) {
                ForEach(0..<100) { index in
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: 30)
                        .overlay(
                            Text("\(index)")
                        )
                }
            }
            .padding()
            .frame(maxWidth:.infinity, maxHeight: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
