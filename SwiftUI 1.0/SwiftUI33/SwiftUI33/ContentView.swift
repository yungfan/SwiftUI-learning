//
//  ContentView.swift
//  SwiftUI33
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isOn: Bool = true
    
    var body: some View {
        
        VStack{
            
            Toggle(isOn: $isOn.animation()) {
                
                Text("开关")
                
            }.padding()
            
            if isOn {
                
                Text("Hello World")
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
