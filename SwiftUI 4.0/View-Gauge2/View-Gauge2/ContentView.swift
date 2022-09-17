//
//  ContentView.swift
//  View-Gauge2
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.0
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            
            Gauge(value: progress) {
                Text("进度条")
            } currentValueLabel: {
                Text(progress.formatted(.percent))
            }
            .tint(.teal)
            .gaugeStyle(.accessoryLinearCapacity)
            
            
            Gauge(value: progress) {
                Text("进度条")
            } currentValueLabel: {
                Text(progress.formatted(.percent))
            }
            .tint(.teal)
            .gaugeStyle(.accessoryCircularCapacity)
        }
        .padding()
        .onReceive(timer) { _ in
            progress  += 0.1
            if progress >= 1.0 {
                progress = 1.0
                timer.upstream.connect().cancel()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
