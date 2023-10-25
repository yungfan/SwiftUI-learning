//
//  Note.swift
//  NoteApp
//
//  Created by 杨帆 on 2023/10/25.
//

import SwiftData
import SwiftUI

@Model
class Note {
    var content: String
    var isFavourite = false
    var category: NoteCategory?

    init(content: String, category: NoteCategory? = nil) {
        self.content = content
        self.category = category
    }
}
