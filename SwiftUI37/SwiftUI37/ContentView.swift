//
//  ContentView.swift
//  SwiftUI37
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ChildView: View {
    
    @Binding var count: Int
    
    var body: some View {
        
        Button("改变count的值"){
            
            self.count += 1
        }
        
    }
}

struct ContentView: View {
    
    @State private var count:Int = 0
    
    var body: some View {
        
        VStack{
            
            Text("当前值为:\(count)")
            
            ChildView(count: $count)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
