//
//  ContentView.swift
//  DigitalWoodfish
//
//  Created by 杨帆 on 2022/11/11.
//

import SwiftUI

struct ContentView: View {
    @State var value = "功德值"
    @State var total = 0
    @State var one = 1
    @State var isTap = false

    var body: some View {
        NavigationView {
            VStack {
                if isTap {
                    Text("\(value) + \(one) 👍")
                }

                Image("muyu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .scaleEffect(isTap ? 0.99 : 1.0)
                    .animation(.easeInOut, value: isTap)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .navigationTitle("\(value): \(total)")
            .preferredColorScheme(.dark)
            .onTapGesture {
                total += one
                withAnimation {
                    isTap.toggle()
                }
                AudioTools.shared.playSound()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isTap.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
