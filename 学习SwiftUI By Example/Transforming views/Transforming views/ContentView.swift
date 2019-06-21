//
//  ContentView.swift
//  Transforming views
//
//  Created by 杨帆 on 2019/6/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

/**

struct ContentView : View {
    var body: some View {
 
 
        Text("Forecast: Sun")
            .font(.largeTitle)
            .background(Color.orange)
            //边框与阴影
            .border(Color.red, width: 1, cornerRadius: 3)
            .shadow(color: .red, radius: 5, x: 2, y: 2)
    }
}
 */

struct ContentView : View {
    
    @State var rotation: Double = 0
    @State var scale: Double = 1.0
    
    var body: some View {
        VStack {
            Slider(value: $rotation, from: 0.0, through: 360.0, by: 1.0)
            Slider(value: $scale, from: 0.0, through: 5.0, by: 0.1)
            
            //旋转
            Text("Up we go")
                .background(Color.orange)
                .rotationEffect(.degrees(rotation))
            
            //3D旋转
            Text("EPISODE LLVM")
                .font(.largeTitle)
                .foregroundColor(.yellow)
                .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 0, z: 0))
            
            //缩放
            Text("Up we go")
                .scaleEffect(CGSize(width: scale, height: scale))

            //圆角 透明度
            Text("Round Me")
                .padding()
                .background(Color.red)
                .cornerRadius(25)
                .opacity(0.3)
            
            //blur
            Text("Welcome to my SwiftUI app")
                .blur(radius: 1)
        }
        .padding()
    }
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
