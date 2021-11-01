//
//  AddView.swift
//  SwiftUI49-Contacts
//
//  Created by 杨帆 on 2019/10/23.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @EnvironmentObject var cons: Contacts

    @State var contact: Contact

    var body: some View {
        VStack {
            TextField("请输入用户名", text: $contact.name).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("请输入手机号", text: $contact.phone).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("请输入地址", text: $contact.address).textFieldStyle(RoundedBorderTextFieldStyle()).padding()

            Button("确定") {
                self.presentationMode.wrappedValue.dismiss()

                self.cons.contacts.append(self.contact)
            }

            Spacer()
        }.navigationBarTitle("添加数据")
    }
}
