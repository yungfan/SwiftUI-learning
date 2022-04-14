//
//  ViewModelWatch.swift
//  ViewModelWatch
//
//  Created by 杨帆 on 2021/8/26.
//

import SwiftUI
import WatchConnectivity

class ViewModelIWatch: NSObject, WCSessionDelegate, ObservableObject {
    @Published var message = ""
    var session: WCSession

    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        self.session.activate()
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }

    // 代理方法获取数据
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            self.message = message["name"] as? String ?? "Unknown"
        }
    }
}
