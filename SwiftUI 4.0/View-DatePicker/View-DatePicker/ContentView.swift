//
//  ContentView.swift
//  View-DatePicker
//
//  Created by 杨帆 on 2022/9/16.
//

import SwiftUI

struct ContentView: View {
    @State private var birthday: Date = .now
    
    var body: some View {
        DatePicker(selection: $birthday, displayedComponents: .date) {
            Text("出生日期")
        }
        .datePickerStyle(.custom)
        .padding()
    }
}

struct CustomStyle: DatePickerStyle {
    @Environment(\.calendar) var calendar
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
            
            Text("选择日期：\(configuration.selection.formatted(.dateTime.year().month().day().locale(Locale(identifier: "zh_Hans_CN"))))")
            
            HStack {
                Button("+") {
                    configuration.selection = addDay(to: configuration.selection)
                }
                
                Button("-") {
                    configuration.selection = minusDay(to: configuration.selection)
                }
            }
        }
        .font(.title)
    }
    
    func addDay(to date: Date) -> Date {
        calendar.date(byAdding: DateComponents(day: 1), to: date)!
    }
    
    func minusDay(to date: Date) -> Date {
        calendar.date(byAdding: DateComponents(day: -1), to: date)!
    }
}

extension DatePickerStyle where Self == CustomStyle {
    static var custom: CustomStyle {
        CustomStyle()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
