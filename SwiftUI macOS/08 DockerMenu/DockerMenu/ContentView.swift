//
//  ContentView.swift
//  DockerMenu
//
//  Created by 杨帆 on 2022/4/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()

            ZStack {
                Color.orange

                Text("主界面")
            }
            .navigationTitle("Preferences")
        }
        .frame(minWidth: 700,
               idealWidth: 1000,
               maxWidth: .infinity,
               minHeight: 400,
               idealHeight: 800,
               maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
