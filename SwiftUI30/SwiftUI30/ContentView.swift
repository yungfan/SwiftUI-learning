//
//  ContentView.swift
//  SwiftUI30
//
//  Created by 杨帆 on 2019/10/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            
            Text("Hello World").font(.title).bold().foregroundColor(.orange).italic().padding()
            
            
            Text("Hello World").bold().font(.title).italic().foregroundColor(.orange).padding()
            
//            Text("Hello World").padding().bold().font(.title).italic().foregroundColor(.orange)

        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
