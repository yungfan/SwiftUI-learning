//
//  ContentView.swift
//  SwiftUI-Poetry
//
//  Created by 杨帆 on 2020/4/13.
//  Copyright © 2020 杨帆. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var poeryStore: PoetryStore = PoetryStore()
    
    var body: some View {
        // 通过数据源构造列表
        NavigationView {
            List(poeryStore.poetries) { poetry in
                HStack{
                    Spacer()
                    
                    VStack(spacing: 10){
                        
                        Text(poetry.title).font(.title).bold().foregroundColor(Color.primary)
                        
                        Text(poetry.author).font(.headline).foregroundColor(Color.primary)
                        
                        ForEach(poetry.paragraphs, id: \.self) {  paragraph in
                            
                            Text(paragraph).foregroundColor(Color.primary)
                            
                        }
                    }.frame(maxWidth: UIScreen.main.bounds.size.width - 32)
                        .padding()
                        .background(Color.blue.opacity(0.5)).cornerRadius(16)
                        .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 5, y: 5)
                    
                    Spacer()
                }.padding(.vertical)
            }
            .navigationBarTitle("宋诗")
            .onAppear { UITableView.appearance().separatorStyle = .none }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ContentView()
                // 预览设备
                .previewDevice("iPhone SE")
            ContentView()
            
            ContentView().environment(\.colorScheme, .dark)
        }
    }
}
