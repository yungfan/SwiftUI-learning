//
//  ContentView.swift
//  SwiftUI-Timer
//
//  Created by student on 2021/6/2.
//

import Combine
import SwiftUI

class TimerViewModel: ObservableObject {
    // Combine Timer
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    // 订阅
    private var timerSubscription: Cancellable?
    // 计数
    @Published var count = 0

    // 开始计时
    func startTimer() {
        timerSubscription = timer.sink(receiveValue: { _ in
            self.count = self.count + 1
        })
    }

    // 停止计时
    func stopTimer() {
        timerSubscription = nil
    }
}

struct ContentView: View {
    @ObservedObject var viewModel: TimerViewModel = TimerViewModel()

    var body: some View {
        VStack {
            Text(viewModel.count.description)

            HStack {
                Button("开始") {
                    viewModel.startTimer()
                }

                Button("停止") {
                    viewModel.stopTimer()
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
