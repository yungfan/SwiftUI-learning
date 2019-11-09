//
//  MenuItem.swift
//  Supplement02
//
//  Created by 杨帆 on 2019/11/9.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct MenuItem: View {
    // 文字
    var itemName: String
    // 图片
    var itemImageName: String
    
    var body: some View {
        NavigationLink(destination: Text(itemName)) {
            
            HStack {
              
                Image(systemName: itemImageName)
                Spacer()
                Text(itemName)
                
                
            }
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 15))
            
        }
    }
}

