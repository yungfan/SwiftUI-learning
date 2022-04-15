//
//  ContentView.swift
//  Pannel
//
//  Created by 杨帆 on 2022/4/15.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @State var readFileContent = "No Content"
    @State var saveFileContent = ""

    var body: some View {
        HStack {
            VStack {
                Text(readFileContent)

                // 读文件，需要设置沙盒的User Selected File为Read/Write
                Button("Select File") {
                    let panel = NSOpenPanel()
                    panel.canChooseFiles = false
                    panel.allowsMultipleSelection = false
                    panel.canChooseDirectories = false
                    // 允许的文件后缀名
                    panel.allowedContentTypes = [UTType.text]
                    panel.begin(completionHandler: { result in
                        if result == NSApplication.ModalResponse.OK {
                            let fileURLs = panel.urls
                            for url: URL in fileURLs {
                                guard let string = try? NSString(contentsOf: url as URL, encoding: String.Encoding.utf8.rawValue)
                                else {
                                    return
                                }
                                self.readFileContent = string as String
                            }
                        }

                    })
                }
            }
            .padding()
            .frame(minWidth: 300)

            Spacer()

            VStack {
                TextEditor(text: $saveFileContent)

                // 保存文件
                Button("Save File") {
                    let panel = NSSavePanel()
                    // 面板标题
                    panel.title = "Save File"
                    // 面板消息
                    // panel.message = "Save My File"
                    panel.allowedContentTypes = [UTType.text]
                    // 保存的文件名
                    panel.nameFieldStringValue = "test.txt"
                    panel.begin(completionHandler: { result in
                        if result == NSApplication.ModalResponse.OK {
                            let url = panel.url
                            _ = try? saveFileContent.write(to: url!, atomically: true, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
                        }
                    })
                }
            }
            .padding()
            .frame(minWidth: 300)
        }
        .frame(maxWidth: 1000, maxHeight: 600)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
