//
//  ContentView.swift
//  Animation
//
//  Created by 杨帆 on 2019/6/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

/**

//基本动画
struct ContentView: View {
    @State var angle: Double = 0
    @State var borderThickness: Length = 1
    
    var body: some View {
        Button(action: {
            self.angle += 45
            self.borderThickness += 1
        }) {
            Text("Tap here")
                .padding()
                .border(Color.red, width: borderThickness)
                .rotationEffect(.degrees(angle))
                .animation(.basic())
        }
    }
}
 */

/**
//弹簧动画
struct ContentView: View {
    
    
    @State var angle: Double = 0
    
    var body: some View {
        
        Button(action: {
            self.angle += 150
        }) {
            
            Text("Tap here")
                .padding()
                .rotationEffect(.degrees(angle))
                .animation(.spring(mass: 1, stiffness: 1, damping: 0.1, initialVelocity: 1))
        }
    }
    
    
}
*/

/**

//animate changes in binding values
struct ContentView : View {
    @State var showingWelcome = false
    
    var body: some View {
        VStack {
            //默认是没有动画的，可以给绑定的加一个animation()
            Toggle(isOn: $showingWelcome.animation()) {
                Text("Toggle label")
            }
            
            if showingWelcome {
                Text("Hello World")
            }
        }
    }
}
  */

/**

//更加精细控制动画
struct ContentView: View {
    @State var opacity: Double = 1
    
    var body: some View {
        Button(action: {
            withAnimation(.basic(duration: 2.0, curve: .linear)) {
                self.opacity -= 0.1
            }
        }) {
            Text("Tap here")
                .padding()
                .opacity(opacity)
        }
    }
}
 */

//转场
struct ContentView: View {
    @State var showDetails = false
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.showDetails.toggle()
                }
            }) {
                Text("Tap to show details")
            }
            
            if showDetails {
                Text("Details go here.")
                    //.transition(.move(edge: .bottom))
                 //.transition(.slide)
                .transition(.scale())
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
