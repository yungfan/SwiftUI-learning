//
//  ContentView.swift
//  View-MultiDatePicker
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.calendar) var calendar
    @State private var dates: Set<DateComponents> = []

    var formatDate: String {
        dates.compactMap { components in
            calendar
                .date(from: components)?.formatted(.dateTime.year().month().day().locale(Locale(identifier: "zh_Hans_CN")))
        }
        .formatted()
    }

    var body: some View {
        VStack {
            MultiDatePicker("选择多个日期", selection: $dates)

            Text(formatDate)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
