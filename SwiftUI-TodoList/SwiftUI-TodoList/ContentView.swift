//
//  ContentView.swift
//  SwiftUI-TodoList
//
//  Created by 杨帆 on 2021/4/6.
//

import CoreData
import SwiftUI

struct ContentView: View {
    // 上下文
    @Environment(\.managedObjectContext) private var viewContext
    // 存储器
    let persistenceController = PersistenceController.shared
    // 查询结构
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TodoItem.createTime, ascending: false)],
        animation: .default)
    private var items: FetchedResults<TodoItem>
    // 新增数据
    @State private var content = ""

    var body: some View {
        NavigationView {
            List {
                // 增加新任务
                Section(header: Text("新任务")) {
                    HStack {
                        TextField("请输入新任务", text: $content)

                        Button {
                            self.addItem(content: self.content)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }

                Section(header: Text("任务列表")) {
                    ForEach(items) { (item: TodoItem) in
                        ToDoListItemView(item: item)
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("ToDoList")
            .toolbar {
                EditButton()
            }
        }
    }

    // 增
    private func addItem(content: String) {
        withAnimation {
            let newItem = TodoItem(context: viewContext)
            newItem.content = content
            newItem.createTime = Date()
            persistenceController.save()
        }
    }

    // 删
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            persistenceController.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
