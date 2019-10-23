//
//  ContentView.swift
//  SwiftUI04
//
//  Created by 杨帆 on 2019/10/18.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack() {
            
            Circle().frame(width: 50, height: 50).foregroundColor(.orange)
            
            Divider()
            
            Text("1").font(.title)
            
            Spacer()
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
