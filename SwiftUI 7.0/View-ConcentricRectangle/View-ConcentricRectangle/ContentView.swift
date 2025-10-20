//
//  ContentView.swift
//  View-ConcentricRectangle
//
//  Created by 杨帆 on 2025/8/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            ConcentricRectangle()
                .fill(.red.gradient)
                .frame(height: 100)

            ConcentricRectangle(uniformTopCorners: 20, uniformBottomCorners: 40)
                .fill(.green.gradient)
                .frame(height: 100)

            ConcentricRectangle(topLeadingCorner: 10, topTrailingCorner: 25, bottomLeadingCorner: 55, bottomTrailingCorner: 40)
                .fill(.blue.gradient)
                .frame(height: 150)

            ConcentricRectangle(corners: .fixed(20))
                .fill(.orange.gradient)
                .frame(height: 100)

            // 同心圆
            ZStack {
                ConcentricRectangle()
                    .fill(.black.gradient)

                ConcentricRectangle()
                    .fill(.purple.gradient)
                    .padding(.all, 5)
            }
            .frame(height: 100)
            .containerShape(.rect(cornerRadius: 30))
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
