//
//  ContentView.swift
//  SwiftUI05
//
//  Created by 杨帆 on 2019/10/19.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
        
            Image("yungfan").resizable().frame(width: 200, height: 90).clipShape(RoundedRectangle(cornerRadius: 10))
            Image(systemName: "cloud.fill").foregroundColor(.red).font(.largeTitle)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
