//
//  ContentView.swift
//  SwiftUI-震动反馈
//
//  Created by 杨帆 on 2020/4/9.
//  Copyright © 2020 杨帆. All rights reserved.
//

import SwiftUI

// 震动反馈
func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
    
}

// 另外一个类型的震动
func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    UIImpactFeedbackGenerator(style: style).impactOccurred()
}

// 滚轮的震动
func select() {
    UISelectionFeedbackGenerator().selectionChanged()
}

struct ContentView: View {
    
    var body: some View {
        
        VStack(spacing: 50) {
            Button("Success"){
                
                haptic(type: .success)
                
            }
            Button("Error"){
                
                impact(style: .heavy)
                
            }
            Button("Warning"){
                
                select()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
