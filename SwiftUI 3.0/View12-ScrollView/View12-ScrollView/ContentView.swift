//
//  ContentView.swift
//  View12-ScrollView
//
//  Created by 杨帆 on 2021/10/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            Color.orange
                .frame(width: UIScreen.main.bounds.width, height: 1500)
        }
        .safeAreaInset(edge: .top) {
            VStack {
                Text("顶部")
                Divider()
                    .frame(height: 5)
                    .background(.red)
            }
        }
        .safeAreaInset(edge: .bottom) {
            VStack {
                Divider()
                    .frame(height: 3)
                    .background(.green)
                Text("底部")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
