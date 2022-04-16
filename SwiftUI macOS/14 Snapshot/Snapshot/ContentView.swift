//
//  ContentView.swift
//  Snapshot
//
//  Created by 杨帆 on 2022/4/16.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @State var image: NSImage? = nil

    var siderBar: some View {
        VStack {
            Color.red
                .frame(width: 100, height: 100)

            Color.green
                .frame(width: 150, height: 150)

            Color.blue
                .frame(width: 200, height: 200)
        }
        .padding()
        .border(.orange, width: 5)
    }

    var body: some View {
        NavigationView {
            siderBar
                .frame(minWidth: 300)
                .toolbar(content: {
                    ToolbarItem {
                        Button {
                            image = siderBar.renderAsImage()
                        } label: {
                            Image(systemName: "camera")
                        }
                    }
                })
                .navigationTitle("Snapshot")

            Image(nsImage: image ?? NSImage())
        }
        .frame(minWidth: 700,
               idealWidth: 1200,
               maxWidth: .infinity,
               minHeight: 500,
               idealHeight: 800,
               maxHeight: .infinity)
    }
}

extension View {
    func snapshot() -> NSImage? {
        let controller = NSHostingController(rootView: self)
        let targetSize = controller.view.intrinsicContentSize
        let contentRect = NSRect(origin: .zero, size: targetSize)

        guard
            let bitmapRep = controller.view.bitmapImageRepForCachingDisplay(in: contentRect)
        else { return nil }

        controller.view.cacheDisplay(in: contentRect, to: bitmapRep)
        let image = NSImage(size: bitmapRep.size)
        image.addRepresentation(bitmapRep)
        return image
    }
}

class NoInsetHostingView<V>: NSHostingView<V> where V: View {
    override var safeAreaInsets: NSEdgeInsets {
        return .init()
    }
}

extension View {
    func renderAsImage() -> NSImage? {
        let view = NoInsetHostingView(rootView: self)
        view.setFrameSize(view.intrinsicContentSize)
        return view.bitmapImage()
    }
}

public extension NSView {
    func bitmapImage() -> NSImage? {
        guard let rep = bitmapImageRepForCachingDisplay(in: bounds) else {
            return nil
        }

        cacheDisplay(in: bounds, to: rep)

        guard let cgImage = rep.cgImage else {
            return nil
        }

        return NSImage(cgImage: cgImage, size: bounds.size)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
