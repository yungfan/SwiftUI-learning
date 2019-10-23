//
//  ContentView.swift
//  SwiftUI42
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

class Delegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        print("开始编辑")
        
    }
    
}

struct MyTextField: UIViewRepresentable {
    
    var placeholder: String
    var text: String
    
    
    var delegate = Delegate()
    
    func makeUIView(context: UIViewRepresentableContext<MyTextField>) -> UITextField {
        
        let tv = UITextField()
        tv.placeholder = placeholder
        tv.borderStyle = .roundedRect
        tv.delegate = delegate
        tv.text = text
        
        return tv
        
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<MyTextField>) {
        
    }
    
}


struct ContentView: View {
    var body: some View {
        
        MyTextField(placeholder: "请输入内容", text: "默认内容").frame(height:40).padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
