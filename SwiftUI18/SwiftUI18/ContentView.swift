//
//  ContentView.swift
//  SwiftUI18
//
//  Created by 杨帆 on 2019/10/19.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var names = ["zhangsan", "lisi", "wangwu"]
    
    var body: some View {
        
        VStack {
            
            Button("添加"){
                
                self.names.append("YungFan\(Int.random(in: 0...10))")
            }
            
            EditButton()
            
            List {
                
                ForEach(names, id: \.self) { name in
                    
                    Text(name)
                    
                }.onDelete(perform: delete)
                .onMove(perform: move)
                
                
            }
        }
    }
    
    func delete(at:IndexSet) {
        
        names.remove(at: at.first!)
        
    }
    
    func move(from:IndexSet, to:Int){
        
        names.move(fromOffsets: from, toOffset: to)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
