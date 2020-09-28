//
//  ContentView.swift
//  SwiftUI10
//
//  Created by 杨帆 on 2019/10/19.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var number: Int = 0
    
    var body: some View {
        
        VStack {
       
        
            Stepper(onIncrement: {
                
                self.number += 1
                
            }, onDecrement: {
                
                self.number -= 1
                
            }) {
                Text("商品数量\(number)")
            }
            
            
            Stepper("商品数量", value: $number, in: 0...10)
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
