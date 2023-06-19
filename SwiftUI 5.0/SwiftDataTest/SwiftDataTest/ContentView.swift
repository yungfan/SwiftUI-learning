//
//  ContentView.swift
//  SwiftDataTest
//
//  Created by 杨帆 on 2023/6/6.
//

import SwiftData
import SwiftUI

// MARK: - 模型，必须是class
@Model
class TodoItem {
    @Attribute(.unique)
    var id: UUID
    var title: String
    var isCompleted: Bool

    init(title: String, isCompleted: Bool) {
        id = UUID()
        self.title = title
        self.isCompleted = isCompleted
    }
}

struct ContentView: View {
    // 模型上下文，用于操作数据
    @Environment(\.modelContext) private var modelContext
    // 4. 查询
    @Query private var todoItems: [TodoItem]
    @State private var title: String = ""
    @State private var isCompleted: Bool = false

    var body: some View {
        VStack {
            TextField("请输入标题", text: $title)
                .textFieldStyle(.roundedBorder)

            Toggle("是否完成", isOn: $isCompleted)

            // 1. 增加
            Button("保存") {
                let todoItem = TodoItem(title: title, isCompleted: isCompleted)
                modelContext.insert(todoItem)
                do {
                    try modelContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }

            TodoListView(todoItems: todoItems)
        }
        .padding()
    }
}

// MARK: - 列表View，展示所有数据
struct TodoListView: View {
    @Environment(\.modelContext) private var modelContext
    let todoItems: [TodoItem]

    var body: some View {
        List {
            ForEach(todoItems) { todoItem in
                HStack {
                    Text(todoItem.title)

                    Spacer()

                    todoItem.isCompleted ? Image(systemName: "checkmark.square") : Image(systemName: "square")
                }
                .onTapGesture {
                    // 3. 修改
                    todoItem.isCompleted.toggle()
                    todoItem.title.append("-M")
                }
            }
            .onDelete(perform: deletedTodoItem)
        }
    }

    func deletedTodoItem(_ indexSet: IndexSet) {
        indexSet.forEach { index in
            let todoItem = todoItems[index]
            // 2. 删除
            modelContext.delete(todoItem)
        }
    }
}

#Preview {
    ContentView()
}
