//
//  ContentView.swift
//  图片
//
//  Created by 杨帆 on 2019/6/18.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView : View {

    var body: some View {
        
        
        Image("jobs")
            .resizable()
            .frame(width: Length(100),
                   height: Length(100),
                   alignment: .center)
            .clipShape(Circle())
            .overlay(Circle()
            .stroke(Color.gray, lineWidth:2))
            .tapAction {
                print("Tap ")
                
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
