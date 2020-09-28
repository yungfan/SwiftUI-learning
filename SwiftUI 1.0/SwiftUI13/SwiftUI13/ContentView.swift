//
//  ContentView.swift
//  SwiftUI13
//
//  Created by 杨帆 on 2019/10/19.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            
            Text("Hello World").onTapGesture {
                print("单击Text")
            }.onAppear {
                print("Text显示出来")
            }
            
            Image(systemName: "person").onTapGesture(count: 2) {
                print("单击Image")
            }
            
        }.onAppear {
            
            print("View显示出来")
            
        }.onDisappear(){
            
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
