//
//  IAP.swift
//  SwiftUI2Learning
//
//  Created by 杨帆 on 2021/4/10.
//

import SwiftUI

struct IAPView: View {
    @StateObject var store = Store()

    var body: some View {
        ForEach(store.allProducts, id: \.self) { product in
            Group {
                if !product.isLocked {
                    Text("已解锁高级版本")
                } else {
                    if let price = product.price, product.isLocked {
                        VStack {
                            Text("尚未解锁高级版本")

                            Spacer()
                                .frame(maxHeight: 100)

                            HStack {
                                Button("\(price)解锁") {
                                    if let product = store.product(for: product.id) {
                                        store.purchaseProduct(product)
                                    }
                                }

                                Spacer()

                                Button("恢复购买") {
                                    store.restorePurchases()
                                }
                            }.padding(.horizontal, 20)
                        }
                    }
                }
            }
        }
        .onAppear {
            store.loadStoredPurchases()
        }
    }
}
