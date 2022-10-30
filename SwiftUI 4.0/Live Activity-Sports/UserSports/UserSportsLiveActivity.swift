//
//  UserSportsLiveActivity.swift
//  UserSports
//
//  Created by 杨帆 on 2022/10/25.
//

import ActivityKit
import SwiftUI
import WidgetKit

// MARK：- ActivityAttributes，需要共享给App与Widget
struct UserSportsAttributes: ActivityAttributes {
    // 内部结构体ContentState，通过它启动、更新与终止Activity
    public struct ContentState: Codable, Hashable {
        // ContentState需要的属性，可以实时更新
        let amount: Double
    }

    // ActivityAttributes需要的属性，非实时更新
    var date: Date
    let name: String
}

// MARK：- SwiftUI View
struct SportActivityView: View {
    // 运动名称
    let name: String
    // 运动开始与结束时间
    let startDate: Date
    var endDate: Date {
        startDate.addingTimeInterval(60)
    }

    // 运动量
    let amount: Double

    var body: some View {
        HStack(spacing: 20) {
            ProgressView(timerInterval: startDate ... endDate) {
                let total = String(format: "%.1f", amount)
                Text("本次\(name) \(total) m")
                    .font(.system(size: 17))
            }
            .tint(.green)

            Image(systemName: "figure.run")
                .foregroundStyle(.green)
        }
        .foregroundStyle(.white)
        .padding()
        .activityBackgroundTint(Color.purple.opacity(0.5)) // 背景色
    }
}

// MARK：- LiveActivity
struct UserSportsLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: UserSportsAttributes.self) { context in
            // 锁屏时的显示内容
            SportActivityView(name: context.attributes.name,
                              startDate: context.attributes.date,
                              amount: context.state.amount)
        } dynamicIsland: { _ in
            // App退到后台时DynamicIsland的显示内容
            DynamicIsland {
                // DynamicIsland展开后的显示内容
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                }
            } compactLeading: {
                // DynamicIsland未展开时的左边显示内容
                Text("L")
            } compactTrailing: {
                // DynamicIsland未展开时的右边显示内容
                Text("T")
            } minimal: {
                // DynamicIsland最小化时的显示内容
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com")) // 点击DynamicIsland进入App时传入的URL
            .keylineTint(Color.red)
        }
    }
}
