//
//  ContentView.swift
//  FirstApp
//
//  Created by 杨帆 on 2022/4/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .frame(minWidth: 800,
                   idealWidth: 1000,
                   maxWidth: .infinity,
                   minHeight: 400,
                   idealHeight: 600,
                   maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
