//
//  ContentView.swift
//  GragImage
//
//  Created by 杨帆 on 2022/4/16.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @State var image: NSImage? = nil
    @State private var dragOver = false

    var body: some View {
        NavigationView {
            Text("iPhone 13")
                .padding()

            ZStack {
                Color.orange
                    .frame(width: 214, height: 463)

                Text(dragOver ? "" : "拖动图片到这里")

                Image(nsImage: image ?? NSImage())
                    .resizable()
                    .frame(idealWidth: 214, idealHeight: 463)
                    .scaledToFit()
                    .padding()
                    .onDrop(of: ["public.file-url"], isTargeted: $dragOver) { providers -> Bool in
                        providers.first?.loadDataRepresentation(forTypeIdentifier: "public.file-url", completionHandler: { data, _ in
                            if let data = data, let path = NSString(data: data, encoding: 4), let url = URL(string: path as String) {
                                let image = NSImage(contentsOf: url)
                                DispatchQueue.main.async {
                                    self.image = image
                                }
                            }
                        })
                        return true
                    }
                    .onDrag {
                        let data = self.image?.tiffRepresentation
                        let provider = NSItemProvider(item: data as NSSecureCoding?, typeIdentifier: UTType.tiff.identifier)
                        provider.previewImageHandler = { (handler, _, _) -> Void in
                            handler?(data as NSSecureCoding?, nil)
                        }
                        return provider
                    }
            }
            .navigationTitle("拖拽图片")
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
