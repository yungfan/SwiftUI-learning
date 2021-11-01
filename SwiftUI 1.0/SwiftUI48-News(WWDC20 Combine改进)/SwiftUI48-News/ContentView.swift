//
//  ContentView.swift
//  SwiftUI48-News
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dataPublisher: DataPublisher = DataPublisher()

    var body: some View {
        NavigationView {
            List {
                ForEach(dataPublisher.news, id: \.self) { item in
                    NavigationLink(destination: DetailsView(urlString: item.url)) {
                        RowView(dataItem: item)
                    }
                }
            }.navigationBarTitle("新闻列表")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
