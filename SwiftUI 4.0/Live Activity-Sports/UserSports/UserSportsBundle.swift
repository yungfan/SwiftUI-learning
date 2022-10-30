//
//  UserSportsBundle.swift
//  UserSports
//
//  Created by 杨帆 on 2022/10/25.
//

import WidgetKit
import SwiftUI

@main
struct UserSportsBundle: WidgetBundle {
    var body: some Widget {
        // 原来的Widget
        UserSports()
        // LiveActivity
        UserSportsLiveActivity()
    }
}
