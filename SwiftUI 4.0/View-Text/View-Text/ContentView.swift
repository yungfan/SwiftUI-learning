//
//  ContentView.swift
//  View-Text
//
//  Created by 杨帆 on 2022/9/15.
//

import SwiftUI

struct ContentView: View {
    @State private var isChange = false
    @State private var isBold = false
    @State private var isItalic = false
    let time: Duration = .seconds(6900)
    
    var body: some View {
        VStack {
            Text("WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0")
                .lineLimit(4)
                .border(.teal)
            
            Text("WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0")
                .lineLimit(3...5)
                .border(.purple)
            
            
            Text("WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0，WWDC22 Swift UI 4.0")
                .lineLimit(4, reservesSpace: true)
                .border(.red)
            
            Text("SwiftUI")
                .font(isChange ? .title : .title3)
                .bold(isBold)
                .italic(isItalic)
                .foregroundStyle(isChange ? .red : .green)
                .onTapGesture {
                    withAnimation {
                        isChange.toggle()
                    }
                }
            
            Toggle("Bold", isOn: $isBold)
            Toggle("Italic", isOn: $isItalic)
            
            
            Text("\(time, format: .time(pattern: .hourMinute))")
            Text("\(time, format: .time(pattern: .hourMinute(padHourToLength: 2)))")
            Text("\(time, format: .time(pattern: .hourMinuteSecond))")
            Text("\(time, format: .time(pattern: .minuteSecond))")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
