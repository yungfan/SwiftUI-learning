//
//  ContentView.swift
//  iOS17-Widget
//
//  Created by 杨帆 on 2023/6/12.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @State private var todoItem = TodoItem.shared

    var body: some View {
        VStack(spacing: 10) {
            ForEach(todoItem.todoItems) { todoItem in
                HStack {
                    Button {
                        todoItem.isCompleted.toggle()
                    } label: {
                        Image(systemName: todoItem.isCompleted ? "checkmark.circle.fill" : "circle")
                    }

                    Text(todoItem.title)
                }
                .font(.title)
            }
        }
    }
}

#Preview {
    ContentView()
}
