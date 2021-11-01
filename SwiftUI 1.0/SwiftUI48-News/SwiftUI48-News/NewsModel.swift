//
//  NewsModel.swift
//  SwiftUI48-News
//
//  Created by 杨帆 on 2019/10/23.
//  Copyright © 2019 杨帆. All rights reserved.
//

import Foundation

// MARK: - NewsModel
struct NewsModel: Codable {
    let reason: String
    let result: Result
    let error_code: Int
}

// MARK: - Result
struct Result: Codable {
    let stat: String
    let data: [DataItem]
}

// MARK: - DataItem
struct DataItem: Codable, Hashable {
    var title: String
    var date: String
    var category: String
    var author_name: String
    var url: String
}
