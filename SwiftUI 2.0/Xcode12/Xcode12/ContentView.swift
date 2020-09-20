//
//  ContentView.swift
//  Xcode12
//
//  Created by 杨帆 on 2020/9/16.
//

import SwiftUI

// 自定义View
struct DIYText: View {
    var body: some View {
        Text("DIYText")
            .font(.largeTitle)
            .padding()
    }
}

// 自定义Modifier
extension View {
    func diyStyle() -> some View {
        background(Color.red)
    }
}

struct DIYText_Library: LibraryContentProvider {
    
    var views: [LibraryItem] {
        LibraryItem(DIYText(), title: "DIYText", category: .control)
    }
    
    func modifiers(base: Image) -> [LibraryItem] {
        [LibraryItem(base.diyStyle(), title: "DIYStyle", category: .effect)]
    }
}

struct ContentView: View {
    
    var body: some View {
        VStack {
            Button("登录") {
            }.diyStyle()
        
            Text("Hello SwiftUI 2.0")
                .foregroundColor(.accentColor)

            Slider(value: .constant(0.5))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
