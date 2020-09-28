//
//  ContentView.swift
//  SwiftUI23
//
//  Created by 杨帆 on 2019/10/20.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var present:Bool = false
    
    var body: some View {
        
//        Button("Alert"){
//
//            self.present = true
//
//        }.alert(isPresented: $present) {
//
//            Alert(title: Text("温馨提示"), message: Text("你的手机内存不足"), dismissButton: .cancel())
//
//        }
        
        
        Button("ActionSheet"){
            
            self.present = true
        }.actionSheet(isPresented: $present) {
            
            ActionSheet(title: Text("温馨提示"), message: Text("取相片"), buttons: [.cancel(Text("取消"), action: {
                
            }), .default(Text("相机"), action: {
                
            }), .destructive(Text("相册"), action: {
                
            })])
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
