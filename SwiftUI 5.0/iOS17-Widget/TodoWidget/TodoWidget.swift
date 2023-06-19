//
//  TodoWidget.swift
//  TodoWidget
//
//  Created by 杨帆 on 2023/6/12.
//

import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> TodoEntry {
        TodoEntry(todoItem: TodoItem.shared)
    }

    func getSnapshot(in context: Context, completion: @escaping (TodoEntry) -> Void) {
        let entry = TodoEntry(todoItem: TodoItem.shared)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let entries = [TodoEntry(todoItem: TodoItem.shared)]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct TodoEntry: TimelineEntry {
    let date: Date = .now
    var todoItem: TodoItem
}

struct TodoWidgetEntryView: View {
    // iOS17新增环境变量，设置边距
    @Environment(\.widgetContentMargins) var margins
    @State var entry: Provider.Entry
    @Environment(\.widgetFamily) var family

    var body: some View {
        switch family {
        case .systemSmall:
            VStack(spacing: 10) {
                ForEach(entry.todoItem.todoItems.prefix(3)) { todoItem in
                    HStack {
                        Button(intent: TodoIntent(id: todoItem.id)) {
                            Image(systemName: todoItem.isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                        .buttonStyle(.plain)

                        Text(todoItem.title)
                            .font(.title2)
                    }
                    .padding(.horizontal, margins.leading)
                }
            }
            .foregroundStyle(.white)
            .containerBackground(.orange.gradient, for: .widget) // iOS17新增，设置小组件背景
        case .systemMedium:
            VStack(spacing: 10) {
                ForEach(entry.todoItem.todoItems.prefix(3)) { todoItem in
                    HStack {
                        Button(intent: TodoIntent(id: todoItem.id)) {
                            Image(systemName: todoItem.isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                        .buttonStyle(.plain)

                        Text(todoItem.title)
                            .font(.title2)

                        Spacer()

                        Toggle(todoItem.isCompleted ? "Yes" : "No",
                               isOn: todoItem.isCompleted,
                               intent: TodoIntent(id: todoItem.id))
                    }
                    .padding(.horizontal, margins.leading)
                }
            }
            .foregroundStyle(.white)
            .containerBackground(.purple.gradient, for: .widget)
        default:
            VStack(spacing: 10) {
                ForEach(entry.todoItem.todoItems) { todoItem in
                    HStack {
                        Button(intent: TodoIntent(id: todoItem.id)) {
                            Image(systemName: todoItem.isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                        .buttonStyle(.plain)

                        Text(todoItem.title)
                            .font(.title)

                        Spacer()

                        Toggle(todoItem.isCompleted ? "Yes" : "No",
                               isOn: todoItem.isCompleted,
                               intent: TodoIntent(id: todoItem.id))
                    }
                    .padding(.horizontal, margins.leading)
                }
            }
            .foregroundStyle(.white)
            .containerBackground(.green.gradient, for: .widget)
        }
    }
}

struct TodoWidget: Widget {
    let kind: String = "TodoWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TodoWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("TodoWidget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    TodoWidget()
} timeline: {
    TodoEntry(todoItem: TodoItem.shared)
}

#Preview(as: .systemMedium) {
    TodoWidget()
} timeline: {
    TodoEntry(todoItem: TodoItem.shared)
}

#Preview(as: .systemLarge) {
    TodoWidget()
} timeline: {
    TodoEntry(todoItem: TodoItem.shared)
}
