//
//  ContentView.swift
//  Modifier-Deprecated
//
//  Created by 杨帆 on 2022/9/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack {
                            Button {
                            } label: {
                                Image(systemName: "plus")
                            }

                            Button {
                            } label: {
                                Image(systemName: "heart")
                            }
                        }
                    }

                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                        } label: {
                            Image(systemName: "camera")
                        }
                    }
                }
                .navigationTitle("Deprecated")
                .navigationBarTitleDisplayMode(.inline)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
