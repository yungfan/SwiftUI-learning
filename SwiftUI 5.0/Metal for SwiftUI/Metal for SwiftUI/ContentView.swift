//
//  ContentView.swift
//  Metal for SwiftUI
//
//  Created by 杨帆 on 2023/6/14.
//

import SwiftUI

struct ContentView: View {
    let startDate = Date.now

    var body: some View {
        VStack {
            Image(systemName: "fish.fill")
                .font(.system(size: 200))
                .colorEffect(ShaderLibrary.checkerboard(.float(10), .color(.red)))

            Image(systemName: "fish.fill")
                .font(.system(size: 200))
                .layerEffect(ShaderLibrary.pixellate(.float(10)), maxSampleOffset: .zero)

            TimelineView(.animation) { _ in
                Image(systemName: "fish.fill")
                    .font(.system(size: 200))
                    .visualEffect { content, proxy in
                        content
                            .distortionEffect(ShaderLibrary.complexWave(
                                .float(startDate.timeIntervalSinceNow),
                                .float2(proxy.size),
                                .float(0.5),
                                .float(3),
                                .float(6)
                            ), maxSampleOffset: .zero)
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
