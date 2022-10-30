//
//  ContentView.swift
//  Sports
//
//  Created by 杨帆 on 2022/10/25.
//

import ActivityKit
import Combine
import SwiftUI

struct ContentView: View {
    // 运动量，用于更新Activity的数据
    @State private var amount: Double = 0
    // 定时器计数
    @State private var count = 60
    // 定时器
    @State private var timerPublisher = Timer.publish(every: 5, on: .main, in: .common)
    @State private var timer: Cancellable?
    // Activity
    @State private var activity: Activity<UserSportsAttributes>?

    // MARK：初始化参数
    func setup() {
        amount = 0
        count = 60
        timerPublisher = Timer.publish(every: 5, on: .main, in: .common)
        timer = timerPublisher.connect()
    }

    var body: some View {
        VStack(spacing: 20) {
            Button("启动") {
                setup()

                let attributes = UserSportsAttributes(date: .now, name: "跑步")
                let contentState = UserSportsAttributes.ContentState(amount: amount)

                do {
                    activity = try Activity<UserSportsAttributes>.request(attributes: attributes,
                                                                          contentState: contentState,
                                                                          pushType: nil)
                } catch {
                    print(error.localizedDescription)
                }
            }

            Button("更新") {
                amount = 0

                let contentState = UserSportsAttributes.ContentState(amount: amount)
                Task {
                    await self.activity?.update(using: contentState)
                }
            }

            Button("结束") {
                timer?.cancel()

                Task {
                    await self.activity?.end(using: nil, dismissalPolicy: .immediate)
                }
            }
        }
        .onReceive(timerPublisher) { _ in // 定时器更新Activity
            count -= 5
            if count == 0 {
                timer?.cancel()
            }
            // 修改数据
            amount += Double.random(in: 2.5 ... 25.0)
            let contentState = UserSportsAttributes.ContentState(amount: amount)
            Task {
                await self.activity?.update(using: contentState)
            }
        }
        .task {
            // 终止现有的Activity
            for activity in Activity<UserSportsAttributes>.activities {
                await activity.end()
            }
        }
        .task {
            // 监听某个Activity的启动
            let activities = Activity<UserSportsAttributes>.activityUpdates

            for await activity in activities {
                print("启动了Activity：\(activity)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
