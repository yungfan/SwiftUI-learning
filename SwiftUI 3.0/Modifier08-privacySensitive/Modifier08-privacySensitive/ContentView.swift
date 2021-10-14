//
//  ContentView.swift
//  Modifier08-privacySensitive
//
//  Created by 杨帆 on 2021/10/12.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.redactionReasons) var redactionReasons

    var body: some View {
        if redactionReasons.contains(.privacy) {
            Color.green
                .ignoresSafeArea()
        } else {
            VStack {
                Text("银行卡")
                    .padding()

                Text("6228 8888 8888 8888")
                    .privacySensitive()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
