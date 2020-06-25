//
//  ContentView.swift
//  SwiftUI-Widget
//
//  Created by 杨帆 on 2020/6/25.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("contact", store: UserDefaults(suiteName: "group.cn.abc.yf.SwiftUI-Widget"))
    
    var contactData = Data()
    
    var body: some View {
        List {
            ForEach(Contact.getContacts()) { contact in
                Button(action: {
                    
                    guard let data = try? JSONEncoder().encode(contact) else { return }
                    // 存数据
                    self.contactData = data
                    print("save")
                }) {
                    ListItemView(contact: contact)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
