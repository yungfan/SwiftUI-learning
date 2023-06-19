//
//  TodoIntent.swift
//  iOS17-Widget
//
//  Created by 杨帆 on 2023/6/17.
//

import AppIntents
import Foundation

struct TodoIntent: AppIntent {
    static var title: LocalizedStringResource = "TodoIntent"
    static var description: IntentDescription = IntentDescription("TodoIntent")

    @Parameter(title: "TotoItem ID")
    var id: String

    init() {
    }

    init(id: String) {
        self.id = id
    }

    func perform() async throws -> some IntentResult {
        if let index = TodoItem.shared.todoItems.firstIndex(where: { todoItem in
            todoItem.id == id
        }) {
            TodoItem.shared.todoItems[index].isCompleted.toggle()
        }
        return .result()
    }
}
