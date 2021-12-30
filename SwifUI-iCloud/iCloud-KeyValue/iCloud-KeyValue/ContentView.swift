//
//  ContentView.swift
//  iCloud-KeyValue
//
//  Created by 杨帆 on 2021/12/29.
//

import SwiftUI

struct ContentView: View {
    let store = NSUbiquitousKeyValueStore.default

    var body: some View {
        VStack(spacing: 20) {
            Button("save") {
                store.set("Save iCloud", forKey: "message")
                // 立马生效
                store.synchronize()
            }
            
            Button("update") {
                store.set("Update iCloud", forKey: "message")
                store.synchronize()
            }

            Button("get") {
                let result = store.object(forKey: "message") as! String
                print(result)
            }

            Button("delete") {
                store.removeObject(forKey: "message")
                store.synchronize()
            }

            Button("showAll") {
                // 所有键值对
                print(store.dictionaryRepresentation)
            }
        }
        // 数据发生变化时通知
        .onReceive(NotificationCenter.default.publisher(for: NSUbiquitousKeyValueStore.didChangeExternallyNotification, object: nil)) { notification in
            print(notification)
            print("数据发生变化")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
