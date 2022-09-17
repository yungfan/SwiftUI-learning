//
//  ContentView.swift
//  View-Gauge
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

struct ContentView: View {
    @State private var current = 0.0
    @State private var min = 0.0
    @State private var max = 100.0

    var body: some View {
        VStack {
            Gauge(value: 0.25) {
                Text("Gauge")
            }

            Gauge(value: 0.25) {
                Text("Gauge")
            }
            .gaugeStyle(.accessoryLinearCapacity)

            Gauge(value: 0.5) {
                Text("Gauge")
            }
            .gaugeStyle(.accessoryCircular)
            .tint(.teal)
            .frame(width: 200, height: 200)
            .background(Color.red)

            Gauge(value: 0.5) {
                Text("Gauge")
            }
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(.teal)

            Gauge(value: 0.5) {
                Text("Gauge")
            } currentValueLabel: {
                Text("50%")
            }
            .gaugeStyle(.accessoryCircular)
            .tint(.teal)

            Gauge(value: current, in: min ... max) {
                Text("声音大小")
            } currentValueLabel: {
                Text("\(Int(current))")
            } minimumValueLabel: {
                Text("\(Int(min))")
            } maximumValueLabel: {
                Text("\(Int(max))")
            }
            .gaugeStyle(.accessoryCircular)
            .tint(.teal)
            
            Button("调整") {
                if current < 100 {
                    current += 10
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
