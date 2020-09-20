//
//  ContentView.swift
//  05 Modifier
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI

struct ContentView: View {
    // 获取的文件位置用于列表展示
    @State var selectedFiles: [URL] = []
    
    var includeDirectories: Bool = false
    
    @State private var isImporting: Bool = false
    
    @State private var isMovingSelection: Bool = false
    
    var body: some View {
        NavigationView {
            List(selectedFiles, id: \.self) { url in
                Text(url.absoluteString)
            }
            .toolbar {
                ToolbarItem {
                    HStack {
                        Button("导入", action: { isImporting = true })
                        Button("移动", action: { isMovingSelection = true })
                    }
                }
            }
            .fileImporter(
                isPresented: $isImporting,
                allowedContentTypes: includeDirectories ? [.item, .directory] : [.item],
                allowsMultipleSelection: true
            ) { result in
                do {
                    selectedFiles = try result.get() // 获取导入的文件url
                } catch {
                    print("导入出现异常")
                }
            }
            .fileMover(isPresented: $isMovingSelection, files: selectedFiles) {
                if case .success = $0 {
                    selectedFiles = []
                    print("移动成功")
                } else {
                    print("移动出现异常")
                }
            }
        }.navigationTitle("文件操作")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
