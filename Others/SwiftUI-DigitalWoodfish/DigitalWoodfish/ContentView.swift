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
    @State private var isShow = false
    @State private var timer = Timer.publish(every: 0.8, on: .main, in: .default).autoconnect()

    var body: some View {
        NavigationView {
            ZStack {
                if isShow {
                    Text("\(title) + \(once) 👍")
                        .font(.title3)
                        .offset(y: -200)
                }

                Image("muyu")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .padding()
                    .scaleEffect(isTapped ? 0.85 : 1.0)
                    .animation(.easeInOut, value: isTapped)
                    .offset(y: -50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .navigationTitle("\(title): \(total)")
            .preferredColorScheme(.dark)
            .onTapGesture {
                timer.upstream.connect().cancel()
                moodfish()
                // 手动敲击有震动
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            }
            .onReceive(timer) { _ in
                moodfish()
            }
        }
    }

    func moodfish() {
        withAnimation {
            isTapped.toggle()
            isShow.toggle()

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.isTapped.toggle()
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.isShow.toggle()
            }
            total += once
        }

        AudioTools.shared.playSound()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
