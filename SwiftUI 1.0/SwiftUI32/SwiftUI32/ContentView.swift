//
//  ContentView.swift
//  SwiftUI32
//
//  Created by 杨帆 on 2019/10/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
   //@State var scale: CGFloat = 1.0
    
    @State var degree: Double = 0
    
    var body: some View {
        
//        VStack{
//
//            Image(systemName: "paperplane").scaleEffect(scale).animation(.easeIn(duration: 2.0))
//
//            Button("放大"){
//
//                self.scale += 0.3
//            }
//
//            Button("缩小"){
//
//                self.scale -= 0.3
//            }
//        }
        
        
//                VStack{
//
//                    Image(systemName: "paperplane").rotationEffect(.degrees(degree)).animation(.easeIn(duration: 1.0))
//
//                    Button("旋转"){
//
//                        self.degree += 45.0
//                    }
//
//                }
        
        
        VStack{
        
            Image(systemName: "paperplane").rotationEffect(.degrees(degree)).animation(.spring(response: 0.1, dampingFraction: 0.1, blendDuration: 3.0))
        
                    Button("旋转"){
        
                        self.degree += 45.0
                    }
        
                }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
