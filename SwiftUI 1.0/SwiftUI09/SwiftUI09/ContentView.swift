//
//  ContentView.swift
//  SwiftUI09
//
//  Created by 杨帆 on 2019/10/24.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isOn: Bool = true
    @State var currentValue: Double = 0.5
 
    var body: some View {
        
        VStack {
            
            Toggle(isOn: $isOn) {
                
                self.isOn ? Text("开") : Text("关")
            }
            
            HStack {
                
                 Image(systemName: "sun.min")
                
                 Slider(value: $currentValue, in: 0...1)
                
                 Image(systemName: "sun.max.fill")
            }.padding()
            
            
            
            Text("当前的值为:\(currentValue)")
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
