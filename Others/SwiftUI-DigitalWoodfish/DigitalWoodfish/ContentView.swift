//
//  ContentView.swift
//  DigitalWoodfish
//
//  Created by 杨帆 on 2022/11/11.
//

import SwiftUI

struct ContentView: View {
    @State private var title = "功德值"
    @State private var total = 0
    @State private var once = 1
    @State private var isTapped = false

    var body: some View {
        NavigationView {
            VStack {
                if isTapped {
                    Text("\(title) + \(once) 👍")
                        .font(.title3)
                }

                Image("muyu")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .scaleEffect(isTapped ? 0.95 : 1.0)
                    .animation(.easeInOut, value: isTapped)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .navigationTitle("\(title): \(total)")
            .preferredColorScheme(.dark)
            .onTapGesture {
                total += once
                withAnimation {
                    isTapped.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.isTapped.toggle()
                    }
                }
                AudioTools.shared.playSound()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
