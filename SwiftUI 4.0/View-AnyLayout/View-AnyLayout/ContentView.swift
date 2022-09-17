//
//  ContentView.swift
//  View-AnyLayout
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

struct ContentView: View {
    @State private var isHorizontal = true

    var body: some View {
        // AnyLayout，并根据条件切换
        let layout = isHorizontal ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        
        VStack {
            layout {
                ForEach(0 ..< 5) { index in
                    ZStack {
                        Circle()
                            .frame(width: 50)
                            .foregroundStyle(.teal)
                        
                        Text("\(index)")
                            .foregroundStyle(.white)
                    }
                }
            }
            
            Toggle(isOn: $isHorizontal.animation()) {
                Text("开关")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
