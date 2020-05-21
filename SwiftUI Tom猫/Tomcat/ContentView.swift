//
//  ContentView.swift
//  Tomcat
//
//  Created by 杨帆 on 2020/5/21.
//  Copyright © 2020 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var timer = Timer.publish (every: 0.1, on: .main, in: .common)
    
    @State private var index = 0
    
    private let images = (0...80).map { UIImage(named: "drink_\($0)")! }
    
    var body: some View {
        ZStack {
            Image(uiImage: images[index])
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                .onReceive(
                    timer,
                    perform: { _ in
                        self.index = self.index + 1
                        if self.index > 80 {
                            self.index = 0 
                            self.cancelTimer()
                        }
                }
            )
            
            HStack {
                
                VStack(spacing: 10) {
                    
                    Image("cymbal").onTapGesture {
                        
                        self.instantiateTimer()
                        _ = self.timer.connect()
                    }
                    
                    Image("drink").onTapGesture {
                        
                    }
                    
                    Image("eat")
                }
                
                Spacer()
                
                VStack(spacing: 10) {
                    
                    Image("fart")
                    
                    Image("pie")
                    
                    Image("scratch")
                    
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    
    func instantiateTimer() {
        self.timer = Timer.publish (every: 0.1, on: .main, in: .common)
        return
    }
    
    func cancelTimer() {
        self.timer.connect().cancel()
        return
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
