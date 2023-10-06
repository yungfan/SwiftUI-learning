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
    var title: String
    var isCompleted: Bool
    var date: Date

    init(title: String = "", isCompleted: Bool = false, date: Date = .now) {
        self.title = title
        self.isCompleted = isCompleted
        self.date = date
    }
}

// MARK: - ContentView
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var path = [TodoItem]()
    @State private var searchText = ""
    // 排序方式
    @State private var sortOrder = SortDescriptor(\TodoItem.title)

    var body: some View {
        NavigationStack(path: $path) {
            TodoListView(sort: sortOrder, searchString: searchText)
                .navigationDestination(for: TodoItem.self) { todoItem in
                    EditView(todoItem: todoItem)
                }
                .navigationTitle("TodoList")
                .searchable(text: $searchText)
                .toolbar {
                    // 增加数据
                    Button("Add", systemImage: "plus", action: addTodoItem)

                    // 修改排序方式
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Title")
                                .tag(SortDescriptor(\TodoItem.title, order: .reverse))

                            Text("Date")
                                .tag(SortDescriptor(\TodoItem.date, order: .reverse))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }

    // MARK: 1. 增加
    func addTodoItem() {
        let todoItem = TodoItem()
        modelContext.insert(todoItem)
        // 手动保存
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
        path = [todoItem]
    }
}

// MARK: - TodoListView
struct TodoListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todoItems: [TodoItem]

    // MARK: 查询后修改并过滤排序结果
    init(sort: SortDescriptor<TodoItem>, searchString: String) {
        _todoItems = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.title.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }

    var body: some View {
        if todoItems.isEmpty {
            ContentUnavailableView.search
        } else {
            List {
                ForEach(todoItems) { todoItem in
                    NavigationLink(value: todoItem) {
                        HStack {
                            Text(todoItem.title)

                            Spacer()

                            Text(todoItem.date.formatted(.dateTime.locale(Locale(identifier: "zh_Hans_CN"))))

                            todoItem.isCompleted ? Image(systemName: "checkmark.square") : Image(systemName: "square")
                        }
                    }
                }
                .onDelete(perform: deletedTodoItem)
            }
        }
    }

    // MARK: 2. 删除
    func deletedTodoItem(_ indexSet: IndexSet) {
        indexSet.forEach { index in
            let todoItem = todoItems[index]
            modelContext.delete(todoItem)
            // 判断是否删除，然后保存
            if todoItem.isDeleted {
                do {
                    try modelContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

// MARK: - EditView
struct EditView: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var todoItem: TodoItem

    var body: some View {
        Form {
            // 3. 修改
            TextField("请输入标题", text: $todoItem.title)

            Toggle("是否完成", isOn: $todoItem.isCompleted)

            DatePicker(selection: $todoItem.date) {
                Text("时间")
            }
            .environment(\.locale, Locale(identifier: "zh_Hans_CN"))

            Button("确定") {
                // 判断是否发生变化，然后保存
                if todoItem.hasChanges {
                    do {
                        try modelContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .padding()
        .navigationTitle(todoItem.title.isEmpty ? "添加" : "编辑")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
