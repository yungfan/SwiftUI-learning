//
//  ContentView.swift
//  11 View
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI

struct ContentView: View {
    var items = ["黄", "紫", "红"]

    var colors: [Color] = [.orange, .purple, .red]

    @State var currentIndex: Int = 0
    
    @State private var birthDay: Date = Date()

    var body: some View {
        VStack {
            Text(Date().addingTimeInterval(600), style: .relative)
                .padding()

            Text(Image(systemName: "heart"))

            (Text("Hello ") + Text(Image(systemName: "heart")) + Text(" SwiftUI!"))
                .foregroundColor(.orange)
                .font(.title)

            Image(systemName: "leaf.fill")
                .renderingMode(.original)

            Image("undraw_Camera_re_cnp4")
                .resizable()
                .frame(width: 120, height: 100)

            ZStack {
                colors[currentIndex]

                Picker("颜色", selection: $currentIndex) {
                    ForEach(0 ..< self.items.count) { index in
                        Text(self.items[index])
                            .tag(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .background(Color.white)
            }
            
            DatePicker("日期", selection: $birthDay, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
