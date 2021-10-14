//
//  ContentView.swift
//  View01-AsyncImage
//
//  Created by 杨帆 on 2021/10/8.
//

import SwiftUI

struct ContentView: View {
    let url = URL(string: "https://ss03333.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2718219500,1861579782&fm=26&gp=0.jpg")

    let transaction: Transaction = .init(animation: .linear)

    var body: some View {
        AsyncImage(url: url, transaction: transaction) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case let .success(image):
                image
                    .resizable()
                    .frame(width: 200, height: 200)
            case .failure:
                Button("重新加载") {
                }
            default:
                EmptyView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
