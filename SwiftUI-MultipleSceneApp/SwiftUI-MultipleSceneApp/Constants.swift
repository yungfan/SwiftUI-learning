//
//  Constants.swift
//  SwiftUI-MultipleSceneApp
//
//  Created by 杨帆 on 2021/4/8.
//

import SwiftUI

let targetContentIdentifier = "abc.MultipleSceneApp.SceneTwo"

struct SceneSessionKey: EnvironmentKey {
    static var defaultValue: UISceneSession?
}

extension EnvironmentValues {
    var sceneSession: UISceneSession? {
        get {
            return self[SceneSessionKey.self]
        }
        set {
            self[SceneSessionKey.self] = newValue
        }
    }
}
