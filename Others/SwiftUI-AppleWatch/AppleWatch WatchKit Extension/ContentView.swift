//
//  ContentView.swift
//  AppleWatch WatchKit Extension
//
//  Created by 杨帆 on 2021/8/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = ViewModelIWatch()

    var body: some View {
        VStack {
            // 显示iPhone发送过来的数据
            Text(self.model.message)

            Button("发送数据") {
                // 发给iPhone的数据
                let message = ["name": "我是Apple Watch \(["S3", "S4", "S5", "S6"].randomElement()!)"]

                // 发送数据
                // Apple Watch发送给iPhone，需要取消勾选 Supports Running Without iOS App Installation
                model.session.sendMessage(message, replyHandler: nil) { error in
                    print(error.localizedDescription)
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
