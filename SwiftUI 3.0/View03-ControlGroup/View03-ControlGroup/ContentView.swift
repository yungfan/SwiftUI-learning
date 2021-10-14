//
//  ContentView.swift
//  View03-ControlGroup
//
//  Created by 杨帆 on 2021/10/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ControlGroup {
                Text("喜欢")

                Text("收藏")
            }
            .frame(width: 150)
            .navigationTitle("ControlGroup")
            .toolbar {
                ControlGroup {
                    Button {
                        print("喜欢")
                    } label: {
                        Image(systemName: "heart")
                    }

                    Button {
                        print("收藏")
                    } label: {
                        Image(systemName: "star")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
