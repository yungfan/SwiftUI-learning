//
//  ContentView.swift
//  View-NavigationLink
//
//  Created by 杨帆 on 2022/9/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
//                NavigationLink("点击", destination: Text("下一页"))
//                    .buttonStyle(.borderedProminent)
//                    .controlSize(.regular)
//                    .tint(.teal)
                
                NavigationLink("WWDC", value: "WWDC22")
                    .buttonStyle(.borderedProminent)
                    .controlSize(.regular)
                    .tint(.teal)
                
                NavigationLink("iOS", value: 16)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.regular)
                    .tint(.teal)
            }
            .navigationDestination(for: String.self) { value in
                Text(value)
            }
            .navigationDestination(for: Int.self) { value in
                Text("iOS\(value)")
            }
            .navigationTitle("导航")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
