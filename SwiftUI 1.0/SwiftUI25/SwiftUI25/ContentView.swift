//
//  ContentView.swift
//  SwiftUI25
//
//  Created by 杨帆 on 2019/10/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
        
          Text("Hello World").padding().background(Color.red)
            
            
            
            Text("Hello World").padding().background(RoundedRectangle(cornerRadius: 10).foregroundColor(.orange))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
