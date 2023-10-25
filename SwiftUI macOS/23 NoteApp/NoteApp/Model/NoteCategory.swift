//
//  NoteCategory.swift
//  NoteApp
//
//  Created by 杨帆 on 2023/10/25.
//

import SwiftData
import SwiftUI

@Model
class NoteCategory {
    var categoryTitle: String
    @Relationship(deleteRule: .cascade, inverse: \Note.category)
    var notes: [Note]?

    init(categoryTitle: String) {
        self.categoryTitle = categoryTitle
    }
}
