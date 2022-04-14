//
//  ContentView.swift
//  AppleWatch
//
//  Created by 杨帆 on 2021/8/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = ViewModelIPhone()

    var body: some View {
        // 显示Apple Watch发送过来的数据
        Text(self.model.message)

        Button("发送数据") {
            // 发给Apple Watch的数据
            let message = ["name": "我是iPhone \(["6", "7", "8", "X", "11", "12"].randomElement()!)"]

            // 发送数据
            model.session.sendMessage(message, replyHandler: nil) { error in
                print(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
