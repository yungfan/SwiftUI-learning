//
//  ContentView.swift
//  @ScaledMetric
//
//  Created by 杨帆 on 2020/9/19.
//

import SwiftUI

struct ContentView: View {
    
    @ScaledMetric var size: CGFloat = 40
    
    var body: some View {
        
        VStack {
            Image(systemName: "seal")
                .resizable()
                .frame(width: size, height: size)
            
            Text("Hello, world!")
                .padding()
                .font(.system(size: size))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.sizeCategory, .extraSmall)
    }
}
