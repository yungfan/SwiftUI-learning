//
//  ContentView.swift
//  Modifier09-EllipticalGradient
//
//  Created by 杨帆 on 2021/10/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Rectangle()
            .frame(width: 200, height: 100)
            .foregroundStyle(EllipticalGradient(colors: [.orange, .green]))
        
        
        Rectangle()
            .frame(width: 200, height: 100)
            .foregroundStyle(EllipticalGradient(colors: [.orange, .green], center: .topLeading))
        
        Rectangle()
            .frame(width: 200, height: 100)
            .foregroundStyle(EllipticalGradient(colors: [.orange, .green], center: .topLeading, startRadiusFraction: 0, endRadiusFraction: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
