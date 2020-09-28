//
//  ContentView.swift
//  SwiftUI34
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var opacity: Double = 1.0
    
    var body: some View {
        
        VStack{
            
            Button(action: {
                
                withAnimation(.linear(duration: 2.0)) {
                    
                    self.opacity -= 0.3
                }
                
                
                
            }) {
                
                Text("改变透明度")
                
            }
            
            Text("Hello World").opacity(opacity)
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
