//
//  ContentView.swift
//  View layout
//
//  Created by 杨帆 on 2019/6/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    let colors: [Color] = [.red, .green, .blue]
    
    struct Result {
        var id = UUID()
        var score: Int
    }
    
    let results = [Result(score: 8), Result(score: 5), Result(score: 10)]
    
    var body: some View {
        
        /**
  
        VStack(alignment: .leading, spacing: 20) {
            Text("SwiftUI")
            Text("rocks")
            
            ZStack(alignment: .center) {
                Image("tab_me_nor")
                Text("我的")
                
            }.padding()
            
            
            if Bool.random() {
                Image("tab_qworld_nor")
            } else {
                Text("喜欢")
            }
        }
 
         */

        VStack {
            
            //如果数组里面是简单类型，可以直接通过 .identified(by: \.self)获取里面的值
            ForEach(colors.identified(by: \.self)) { color in
                
                Text("Hello SwiftUI")
                    .padding()
                    .foregroundColor(color)
            }
            
            //如果数组里面的是自定义类型，需要自己处理 .identified(by:)
            
            
            ForEach(results.identified(by: \.id)) { result in
                
                 Text("Result: \(result.score)")
     
            }
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
