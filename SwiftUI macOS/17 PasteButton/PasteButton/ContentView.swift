//
//  ContentView.swift
//  PasteButton
//
//  Created by 杨帆 on 2022/4/17.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @State private var pastedText: String = ""

    var body: some View {
        NavigationView {
            // 读取剪切板内容
            PasteButton(
                supportedContentTypes: [.utf8PlainText]
            ) { itemProviders in
                itemProviders.first(where: {
                    $0.hasItemConformingToTypeIdentifier(UTType.utf8PlainText.identifier)
                })?.loadDataRepresentation(forTypeIdentifier: UTType.utf8PlainText.identifier) { data, _ in
                    if let data = data,
                       let string = String(data: data, encoding: .utf8) {
                        pastedText = string
                    }
                }
            }

            Text(pastedText)
                .navigationTitle("PasteButton")
        }
        .frame(minWidth: 700,
               idealWidth: 1200,
               maxWidth: .infinity,
               minHeight: 500,
               idealHeight: 800,
               maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
