//
//  ContentView.swift
//  SwiftUI40
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct IndicatorView: UIViewRepresentable {
    
    var isAnimated: Bool
    
    
    func makeUIView(context: Self.Context) -> UIActivityIndicatorView {
        
        let activity = UIActivityIndicatorView()
        
        activity.color = .red
        
        return activity
    }

   
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Self.Context){
        
        if isAnimated {
            
            uiView.startAnimating()
        }
        
    }
    
}


struct ContentView: View {
    var body: some View {
        
        IndicatorView(isAnimated: true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
