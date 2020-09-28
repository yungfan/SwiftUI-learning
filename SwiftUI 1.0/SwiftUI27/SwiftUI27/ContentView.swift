//
//  ContentView.swift
//  SwiftUI27
//
//  Created by 杨帆 on 2019/10/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let gradient: Gradient = Gradient(colors: [.white, .red])
    
    var body: some View {
        
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 10).stroke(Color.green, style: StrokeStyle(lineWidth: 4)).frame(height: 50).padding()
            
            RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing)).frame(height: 50).padding()
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
