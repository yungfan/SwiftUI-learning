//
//  ContentView.swift
//  SwiftUI-CalendarView
//
//  Created by 杨帆 on 2025/4/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CalendarView() { date in
            print(date)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
