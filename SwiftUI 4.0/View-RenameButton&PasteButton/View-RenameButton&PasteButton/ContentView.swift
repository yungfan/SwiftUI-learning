//
//  ContentView.swift
//  View-RenameButton&PasteButton
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

struct ContentView: View {
    @State private var isChange = false
    @State private var content = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Rename")
                    .foregroundStyle(isChange ? .red : .green)
                
                TextEditor(text: $content)
                    .border(Color.teal, width: 1)
                
                PasteButton(payloadType: String.self) { strings in
                    guard let first = strings.first else {return}
                    
                    content = first
                }
            }
            .navigationTitle("ReName")
            .toolbar {
                RenameButton()
                    .renameAction {
                        withAnimation {
                            isChange.toggle()
                        }
                    }
            }
        }

        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
