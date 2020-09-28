//
//  ContentView.swift
//  SwiftUI26
//
//  Created by 杨帆 on 2019/10/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let gradient:Gradient = Gradient(colors: [.blue, .red])
    
    var body: some View {
        
        VStack{
        
            Text("Hello World").padding().background(Color.green).cornerRadius(10).border(Color.red, width: 3).shadow(color: .blue, radius: 5)
            
            
            
            Text("Yung Fan").padding().background(
                Rectangle().fill(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
            )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
