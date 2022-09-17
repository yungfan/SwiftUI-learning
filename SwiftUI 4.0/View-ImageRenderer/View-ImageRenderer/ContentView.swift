//
//  ContentView.swift
//  View-ImageRenderer
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

struct ContentView: View {
    @State private var uiImage: UIImage? = nil
    
    
    let topView: some View =
        ZStack {
            Color.orange

            Image(systemName: "desktopcomputer")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
        }

    var body: some View {
        topView

        VStack {
            Button("将topView保存成图片") {
                let render = ImageRenderer(content: topView)
                render.scale = UIScreen.main.scale
                
                uiImage = render.uiImage
            }
            
            if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.teal, lineWidth: 3))
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
