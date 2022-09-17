//
//  ContentView.swift
//  Gesture-Gesture
//
//  Created by 杨帆 on 2022/9/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Color.red
            .frame(width: 300, height: 300)
//            .onTapGesture { location in
//                print(location.x, location.y)
//            }
            .onTapGesture(coordinateSpace: .global) { location in
                print(location.x, location.y)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
