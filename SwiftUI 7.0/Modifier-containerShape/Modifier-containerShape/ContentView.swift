//
//  ContentView.swift
//  Modifier-containerShape
//
//  Created by 杨帆 on 2025/09/04  09:08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.img)
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(.rect(corners: .concentric))
                .padding(5)
                .background(.black.opacity(0.5))
                .containerShape(.rect(cornerRadius: 40)) // concentric+containerShape

            ZStack {
                ConcentricRectangle()
                    .fill(.black.gradient)

                ConcentricRectangle()
                    .fill(.purple.gradient)
                    .padding(.all, 5)
            }
            .frame(height: 200)
            .padding()
            .containerShape(.rect(cornerRadius: 40)) // ConcentricRectangle+containerShape
        }
    }
}


#Preview {
    ContentView()
}
