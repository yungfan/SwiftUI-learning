//
//  ContentView.swift
//  View16-Alert&ActionSheet
//
//  Created by 杨帆 on 2021/10/10.
//

import SwiftUI

struct ContentView: View {
    @State private var modal = false
    
    var body: some View {
        Button("弹出") {
            modal.toggle()
        }
        .confirmationDialog("温馨提示", isPresented: $modal, titleVisibility: .visible) {
            Button("相机") {
                
            }
            
            Button("相册") {
                
            }

            Button("取消", role: .cancel) {
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
