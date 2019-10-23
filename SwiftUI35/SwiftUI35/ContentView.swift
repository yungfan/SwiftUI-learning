//
//  ContentView.swift
//  SwiftUI35
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShow: Bool = false
    
    var body: some View {
        
        VStack {
            
            Button("transition"){
                
                withAnimation {
                    self.isShow.toggle()
                }
                
                
                
            }
            
            if isShow {
                
                Text("Hello World").transition(.move(edge: .trailing))
                
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
