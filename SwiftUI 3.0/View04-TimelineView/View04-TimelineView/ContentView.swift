//
//  ContentView.swift
//  View04-TimelineView
//
//  Created by 杨帆 on 2021/10/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TimelineView(.animation) { context in
            Text(context.date.formatted(.dateTime.year().month().day().hour().minute().second().locale(Locale(identifier: "zh_CN"))))
        }
        
        TimelineView(.periodic(from: .now, by: 3)) {context in
            Text(context.date.formatted(.dateTime.year().month().day().hour().minute().second().locale(Locale(identifier: "zh_CN"))))
        }
        
        TimelineView(.everyMinute) { context in
            Text(context.date.formatted(.dateTime.year().month().day().hour().minute().second().locale(Locale(identifier: "zh_CN"))))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
