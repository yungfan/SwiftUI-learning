//
//  ContentView.swift
//  View08-Text
//
//  Created by 杨帆 on 2021/10/9.
//

import SwiftUI

struct ContentView: View {
    private let value = 12345
    private let percent = 25
    private let price = 100
    private let names = ["zhangsan", "lisi", "wangwu"]
    private let weight = Measurement(value: 100, unit: UnitMass.kilograms)

    var string: AttributedString {
        var str = AttributedString("Hello SwiftUI")
        str.foregroundColor = .green
        str.underlineStyle = .init(pattern: .dashDot, color: Color.red)

        if let range = str.range(of: "Swift") {
            str[range].font = .title
            str[range].foregroundColor = .teal
        }

        return str
    }

    var dateStr: AttributedString {
        var str = Date.now.formatted(.dateTime.year().month().day().attributed)
        str.font = .title
        str.foregroundColor = .mint
        return str
    }

    var body: some View {
        Group {
            Text("Hello, world!")

            Text("**Hello, world!**")

            Text("*Hello, world!*")

            Text("`Hello, world!`")

            Text("~~Hello, world!~~")

            Text("[Hello, world!](https://www.apple.com)")

            Text(string)

            Text(dateStr)
        }

        Text(value, format: .number)

        Text(percent, format: .percent)

        Text(price, format: .currency(code: "rmb"))

        Text(names, format: .list(type: .or))

        Text(weight, format: .measurement(width: .narrow))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
