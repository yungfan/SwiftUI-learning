//
//  ContentView.swift
//  Environment-requestReview
//
//  Created by 杨帆 on 2022/9/17.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    @AppStorage("AppLaunchCount") var launchCount = 0
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("\(launchCount)")
        }
        .onAppear {
            launchCount += 1
            
            if launchCount > 5 {
                requestReview()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
