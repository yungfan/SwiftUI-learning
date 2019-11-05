//
//  NextView.swift
//  AA
//
//  Created by 杨帆 on 2019/11/5.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct NextView: View {
    
    
    @Binding var isActive: Bool
    
    var body: some View {
        Button("返回"){
            // 将isActive设置为false
            self.isActive = false
        }
    }
}

