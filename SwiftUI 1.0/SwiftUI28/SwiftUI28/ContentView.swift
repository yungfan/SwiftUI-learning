//
//  ContentView.swift
//  SwiftUI28
//
//  Created by 杨帆 on 2019/10/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            
            Text("Hello").foregroundColor(.orange).blur(radius: 1)
            
            Button("点击我"){
                
                
            }
            
            Image("yf").blur(radius: 5)
            
            
        }.accentColor(.orange)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
