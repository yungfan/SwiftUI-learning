//
//  ContentView.swift
//  Modifier06-submitLabel
//
//  Created by 杨帆 on 2021/10/12.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        TextField("", text: $username)
            .textFieldStyle(.roundedBorder)
            .padding()
            .submitLabel(.done)

        SecureField("", text: $password)
            .textFieldStyle(.roundedBorder)
            .padding()
            .submitLabel(.return)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
