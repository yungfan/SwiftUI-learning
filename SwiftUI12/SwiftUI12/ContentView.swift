//
//  ContentView.swift
//  SwiftUI12
//
//  Created by 杨帆 on 2019/10/19.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var date: Date = Date()
    
    var dateformatter: DateFormatter {
        
        let df = DateFormatter()
        
        df.dateFormat = "yyyy年MM月dd日 hh:mm:ss"
    
        return df
        
    }
    
    var body: some View {
        
        VStack {
        
            DatePicker(selection: $date, displayedComponents: [.date, .hourAndMinute]) {
                Text("日期")
            }
        
            
            Text(dateformatter.string(from: date))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
