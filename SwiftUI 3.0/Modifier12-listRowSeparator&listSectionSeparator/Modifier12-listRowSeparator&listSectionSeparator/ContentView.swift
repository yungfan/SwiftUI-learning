//
//  ContentView.swift
//  Modifier12-listRowSeparator&listSectionSeparator
//
//  Created by 杨帆 on 2021/10/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        List(0 ..< 10) { i in
//            Text("Row\(i)")
//                .listRowSeparatorTint(.green)
//                // .listRowSeparator(.hidden)
//        }

        List {
            Section {
                ForEach(0 ..< 5) {
                    Text("Row \($0)")
                }
            } header: {
                Text("Header1")
            } footer: {
                Text("Footer1")
            }
            
            Section {
                ForEach(6 ..< 10) {
                    Text("Row \($0)")
                }
            } header: {
                Text("Header2")
            } footer: {
                Text("Footer2")
            }
            .listSectionSeparatorTint(.red, edges: .bottom)
            
            Section {
                ForEach(10 ..< 15) {
                    Text("Row \($0)")
                }
            } header: {
                Text("Header3")
            } footer: {
                Text("Footer3")
            }
            .listSectionSeparator(.hidden, edges: [.top, .bottom])
        }
        .listStyle(.grouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
