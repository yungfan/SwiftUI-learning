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

// MARK: - Datum
struct DataItem: Codable, Hashable {
    let title, date: String
    let author_name: String
    let url: String
}
