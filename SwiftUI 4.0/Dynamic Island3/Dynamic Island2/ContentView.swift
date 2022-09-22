//
//  ContentView.swift
//  Dynamic Island2
//
//  Created by 杨帆 on 2022/9/20.
//

import SwiftUI

struct DynamicIslandView: View {
    // 是否展开
    @Binding var expanded: Bool
    // 定时器
    @State private var timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    // 图片可变值
    @State private var variable = 0.0

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                if expanded {
                    Image(systemName: "waveform.and.mic", variableValue: variable)
                        .foregroundColor(.orange)
                        .padding(.leading, 10)

                    Image(systemName: "airpodspro")
                        .foregroundColor(.white)

                    Spacer()

                    Image(systemName: "figure.pool.swim")
                        .foregroundColor(.green)

                    Image(systemName: "water.waves", variableValue: variable)
                        .foregroundColor(.blue)
                        .padding(.trailing, 10)
                }
            }
            .fontWeight(.heavy)
        }
        .frame(maxWidth: expanded ? 280 : 128, maxHeight: expanded ? 50 : 38)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.linear(duration: 0.3)) {
                expanded.toggle()
            }
        }
        .background {
            Color.black
        }
        .clipShape(RoundedRectangle(cornerRadius: 40.0, style: .continuous))
        .onReceive(timer) { _ in // 定时器切换Image的variableValue，使图片动起来
            switch variable {
            case 0:
                variable = 0.2
            case 0.2:
                variable = 0.4
            case 0.4:
                variable = 0.6
            case 0.6:
                variable = 0.8
            case 0.8:
                variable = 1.0
            case 1.0:
                variable = 0.9
            case 0.9:
                variable = 0.7
            case 0.7:
                variable = 0.5
            case 0.5:
                variable = 0.3
            case 0.3:
                variable = 0.1
            default:
                variable = 0
            }
        }
    }
}

struct ContentView: View {
    @State private var expanded: Bool = false

    var body: some View {
        DynamicIslandView(expanded: $expanded)
            .position(x: UIScreen.main.bounds.midX, y: 30)
            .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
