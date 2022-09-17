//
//  ContentView.swift
//  View-Image
//
//  Created by 杨帆 on 2022/9/15.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 0.5

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "wifi", variableValue: value)
                .foregroundStyle(.red)

            Image(systemName: "cellularbars", variableValue: value)
                .foregroundStyle(.orange)

            Image(systemName: "waveform", variableValue: value)
                .foregroundStyle(.yellow)

            Image(systemName: "touchid", variableValue: value)
                .foregroundStyle(.green)

            Image(systemName: "person.3.sequence.fill", variableValue: value)
                .foregroundStyle(.blue)

            Image(systemName: "timelapse", variableValue: value)
                .foregroundStyle(.purple)
            
            Slider(value: $value)
        }
        .font(.system(size: 60))
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
