//
//  ContentView.swift
//  SwiftUI03
//
//  Created by 杨帆 on 2019/10/24.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
//        Rectangle().foregroundColor(.orange).frame(width: 300, height: 40, alignment: .center)
        
        
//        RoundedRectangle(cornerRadius: 5, style: .circular).foregroundColor(.orange).frame(width: 400, height: 50, alignment: .center)
        
   //     Circle().foregroundColor(.red).padding()
        
        Ellipse().foregroundColor(.blue).padding()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
