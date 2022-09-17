//
//  ContentView.swift
//  View-List
//
//  Created by 杨帆 on 2022/9/16.
//

import SwiftUI

struct ContentView: View {
    @State private var names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
    
    var body: some View {
        VStack {
            List($names, id:\.self, editActions: [.move, .delete]) { $name in
                Text(name)
            }
        }
        .onChange(of: names) { newValue in
            print(names)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
