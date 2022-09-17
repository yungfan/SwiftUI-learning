//
//  ContentView.swift
//  View-AnyLayout
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        // AnyLayout，并根据条件切换
        let layout = horizontalSizeClass == .regular ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())

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
        .animation(.default, value: horizontalSizeClass)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
