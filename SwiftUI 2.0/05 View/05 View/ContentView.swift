//
//  ContentView.swift
//  05 View
//
//  Created by 杨帆 on 2020/9/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            Group {
                Text("Content")
            }

            GroupBox {
                Text("Content")
            }

            LazyVStack {
                ForEach(0 ... 5, id: \.self) { index in
                    GroupBox(label: Text("标签\(index)"), content: {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 100, height: 100)
                            .onAppear(perform: {
                                print(index)
                            })
                    })
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
