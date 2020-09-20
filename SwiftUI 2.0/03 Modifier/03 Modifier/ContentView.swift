//
//  ContentView.swift
//  03 Modifier
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    
    @State private var isShow = false
    
    var body: some View {
        
        Button("推荐App") {
            
            isShow.toggle()
            
        }.appStoreOverlay(isPresented: $isShow) {
            
            SKOverlay.AppConfiguration(appIdentifier: "414478124", position: .bottom)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
