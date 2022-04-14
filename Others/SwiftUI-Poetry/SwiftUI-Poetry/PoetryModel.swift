//
//  PoetModel.swift
//  SwiftUI-Poet
//
//  Created by 杨帆 on 2020/4/13.
//  Copyright © 2020 杨帆. All rights reserved.
//

import SwiftUI
import Combine

struct PoetryModel: Codable, Hashable, Identifiable {
    let author: String
    let paragraphs: [String]
    let title: String
    let id: String
}
