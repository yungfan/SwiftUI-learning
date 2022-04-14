//
//  ContentView.swift
//  MultipeerConnectivityDemo
//
//  Created by 杨帆 on 2021/12/5.
//

import SwiftUI

struct ContentView: View {
    @StateObject var colorSession = MultipeerSession()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Connected Devices")
                .bold()

            Text(String(describing: colorSession.connectedPeers.map(\.displayName)))

            Spacer()

            HStack {
                ForEach(NamedColor.allCases, id: \.self) { color in
                    Button(color.rawValue) {
                        colorSession.send(color: color)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background((colorSession.currentColor.map(\.color) ?? .white).ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
