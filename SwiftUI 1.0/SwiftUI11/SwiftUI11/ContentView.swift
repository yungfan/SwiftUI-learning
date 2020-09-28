//
//  ContentView.swift
//  SwiftUI11
//
//  Created by 杨帆 on 2019/10/19.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let colors = ["赤", "橙", "黄","绿","青","蓝","紫"]
    let colors2 = ["赤", "橙", "黄"]
    @State var selectedIndex = 0
    
    var body: some View {
       
        VStack {
            
            Picker("彩虹", selection: $selectedIndex) {
                ForEach(0..<colors.count) {
                    
                    Text(self.colors[$0])
                    
                }
            }
            
            Text("你选择的颜色为:\(colors[selectedIndex])")
            
            Picker(selection: $selectedIndex, label: Text("")) {
                
                ForEach(0..<colors2.count) {
                    
                    Text(self.colors2[$0])
                    
                }
            }
            
        }.pickerStyle(SegmentedPickerStyle())
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
