//
//  ContentView.swift
//  View-ViewThatFits
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ViewThatFits {
            
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.teal)
                    .frame(width: 300, height: 300)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.teal)
                    .frame(width: 300, height: 300)
            }
            
            
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.red)
                    .frame(width: 300, height: 300)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.red)
                    .frame(width: 300, height: 300)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
