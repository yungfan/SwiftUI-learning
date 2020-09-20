//
//  ContentView.swift
//  03 View
//
//  Created by 杨帆 on 2020/9/19.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var selColor = Color.red
    
    @State private var downloadProgress = 0.0

    
    var body: some View {
        
        VStack{
            ColorPicker("请选择一种颜色", selection: $selColor)
                .labelsHidden()
            
            Text("Hello, world!")
                .foregroundColor(selColor)
                .padding()
            
            ProgressView("正在下载...", value: downloadProgress, total: 100)
                .foregroundColor(.green)
                .progressViewStyle(LinearProgressViewStyle(tint: .red))
                .onReceive(Timer.publish(every: 1.0, on: .main, in: .common).autoconnect(), perform: { _ in
                    if downloadProgress < 100 {
                        downloadProgress += 20
                    }
                })
            
            ProgressView("正在下载...", value: 80, total: 100)
                .foregroundColor(.green)
                .progressViewStyle(CircularProgressViewStyle(tint: .purple))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
