//
//  UpdateView.swift
//  SwiftUI49-Contacts
//
//  Created by 杨帆 on 2019/10/23.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct UpdateView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var contact: Contact
    
    
    var body: some View {
        
        VStack {
            
            TextField("请输入用户名", text: $contact.name).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("请输入手机号", text: $contact.phone).keyboardType(.numberPad).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("请输入地址", text: $contact.address).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            Button("确定"){
                
                self.presentationMode.wrappedValue.dismiss()
                
                //UIApplication.shared.endEditing()
                
            }
            
            Spacer()
        }
        
    }
}
