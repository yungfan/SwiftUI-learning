//
//  ContentView.swift
//  Modifier03-tint&textInputAutocapitalization
//
//  Created by 杨帆 on 2021/10/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    
    var body: some View {
        Button("Hello, world!") {
        }
        .foregroundStyle(.primary)
        .tint(.purple)
        .buttonStyle(.borderedProminent)
        
        TextField("", text: $name)
            .textFieldStyle(.roundedBorder)
            .padding()
            .textInputAutocapitalization(.characters)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
