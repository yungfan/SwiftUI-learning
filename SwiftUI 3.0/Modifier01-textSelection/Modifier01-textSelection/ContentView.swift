//
//  ContentView.swift
//  Modifier01-textSelection
//
//  Created by 杨帆 on 2021/10/11.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    var body: some View {
        Text("Hello, world!")
            .padding()
            .textSelection(.enabled)
        
        TextField("", text: $input)
            .textFieldStyle(.roundedBorder)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
