//
//  ContentView.swift
//  SwiftUI17-自定义Row
//
//  Created by 杨帆 on 2019/10/19.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // 数据源
    let titles = ["2019.10.21", "2019.10.22","2019.10.23","2019.10.24","2019.10.25","2019.10.26","2019.10.27"]
    let subtitles = ["星期一", "星期二","星期三","星期四","星期五","星期六","星期日"]
    let details = ["下雨", "晴天","有雾","多云","阴天","下雪","大风"]
    
    var body: some View {
        
        
        List(0..<titles.count) { index in
            
            VStack(alignment: .leading) {
                
                HStack{
                    
                    Text(self.titles[index]).font(.title).foregroundColor(.orange)
                    
                    Spacer()
                    
                    Text(self.subtitles[index]).font(.subheadline).foregroundColor(.blue)
                    
                }
                
                Text(self.details[index]).font(.largeTitle).italic().bold().foregroundColor(.red)
                
            }.padding()
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
