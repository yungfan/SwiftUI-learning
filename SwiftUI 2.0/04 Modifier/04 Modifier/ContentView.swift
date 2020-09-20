//
//  ContentView.swift
//  04 Modifier
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI

struct ContentView: View {
    
    // 数据源
    let titles = ["2019.10.21", "2019.10.22","2019.10.23","2019.10.24","2019.10.25","2019.10.26","2019.10.27"]
    let subtitles = ["星期一", "星期二","星期三","星期四","星期五","星期六","星期日"]
    let details = ["下雨", "晴天","有雾","多云","阴天","下雪","大风"]
    
    @State private var condition = true
    
    var body: some View {
        // 遍历数据源构造Item
        List(0..<self.titles.count) { item in
            HStack {
                VStack {
                    Text(self.titles[item])
                        .foregroundColor(.orange)
                        .bold()
                        .font(.title)
                    
                    Text(self.subtitles[item])
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                
                Text(self.details[item])
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                    .italic()
                }.padding()
        }.redacted(reason: condition ? .placeholder : [])
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                condition.toggle()
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
