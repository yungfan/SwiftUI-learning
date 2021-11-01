//
//  RowView.swift
//  SwiftUI48-News
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct RowView: View {
    var dataItem: DataItem

    var body: some View {
        HStack {
            Image("yf").resizable().frame(width: 100, height: 100)

            VStack(alignment: .leading) {
                Text(dataItem.title).font(.system(size: 23)).lineLimit(2).foregroundColor(.red)

                Spacer()

                HStack {
                    Text(dataItem.author_name).font(.subheadline)

                    Spacer()

                    Text(dataItem.date).font(.subheadline).foregroundColor(.gray)
                }
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
