//
//  ContentView.swift
//  SwiftUI19
//
//  Created by 杨帆 on 2019/10/20.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
        
            Text("Hello World").navigationBarTitle("标题", displayMode: .inline)
                .navigationBarItems(leading: Button("设置"){
                    
                }, trailing: HStack{
                    
                    Text("编辑")
                    Image(systemName: "person")
                    
                })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
