//
//  ContentView.swift
//  SwiftUI14
//
//  Created by 杨帆 on 2019/10/19.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
      
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack{
                
                Text("Hello")
                Rectangle().foregroundColor(.orange).frame(width: 1200)
                Divider()
                Image(systemName: "cloud")
            }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
