//
//  ContentView.swift
//  SwiftUI-MultipleSceneApp
//
//  Created by 杨帆 on 2021/4/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("主Scene")
                .navigationTitle("主页")
                .navigationBarItems(trailing:
                    Button(action: {
                        let userActivity = NSUserActivity(
                            activityType: targetContentIdentifier
                        )
                        // 与handlesExternalEvents里保持一致
                        userActivity.targetContentIdentifier =
                            targetContentIdentifier

                        // requestSceneSessionActivation创建新场景
                        UIApplication.shared.requestSceneSessionActivation(
                            nil, // nil表示新建
                            userActivity: userActivity,
                            options: nil,
                            errorHandler: nil
                        )
                    }, label: {
                        Image(systemName: "plus")
                    }))

        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
