//
//  ContentView.swift
//  Composing views
//
//  Created by 杨帆 on 2019/6/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

/**

struct ContentView : View {
    
    
    let title = Text("Paul Hudson")
        .font(.largeTitle)
    let subtitle = Text("Author")
        .foregroundColor(.secondary)
    
    
    var body: some View {
        
            VStack {
                //可以使用+拼接多个Text，但是注意并不是所有属性都可以的，比如foregroundColor就不行，因为它返回的不是Text，此时需要用color
                Text("SwiftUI ")
                    .font(.largeTitle)
                    .color(.red)
                    + Text("is ")
                        .font(.headline)
                        .color(.blue)
                    + Text("awesome")
                        .font(.footnote)
                        .color(.orange)
                
                title.color(.red)
                subtitle
            }
 
    }
}
 */

//自定义Modifier来组合属性
struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.red)
            .foregroundColor(Color.white)
            .font(.largeTitle)
    }
}


struct ContentView : View {
    var body: some View {
        Text("Hello, SwiftUI")
            .modifier(PrimaryLabel())
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
