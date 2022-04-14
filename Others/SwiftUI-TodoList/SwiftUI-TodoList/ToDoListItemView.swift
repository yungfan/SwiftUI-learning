//
//  ToDoListItemView.swift
//  SwiftUI-TodoList
//
//  Created by 杨帆 on 2021/4/6.
//

import SwiftUI

struct ToDoListItemView: View {
    var item: TodoItem = TodoItem()

    var formatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return dateFormatter
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(item.content ?? "")
                .font(.title2)

            Text(formatter.string(from: item.createTime ?? Date()))
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView()
    }
}
