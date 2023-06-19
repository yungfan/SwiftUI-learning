//
//  TodoItem.swift
//  iOS17-Widget
//
//  Created by 杨帆 on 2023/6/17.
//

import Foundation

class TodoItem: Identifiable, CustomStringConvertible {
    var id = UUID().uuidString
    var title: String = ""
    var isCompleted: Bool = false
    var todoItems: [TodoItem] = []

    static let shared = TodoItem()

    private init() {
        getTodoItems()
    }

    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }

    func getTodoItems() {
        todoItems = [
            .init(title: "titleA"),
            .init(title: "titleB"),
            .init(title: "titleC"),
            .init(title: "titleD"),
            .init(title: "titleE"),
            .init(title: "titleF"),
            .init(title: "titleG")]
    }

    var description: String {
        return "\(title)—\(isCompleted)"
    }
}

