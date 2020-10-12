//
//  ContentView.swift
//  SwiftUI-Widget
//
//  Created by 杨帆 on 2020/6/25.
//

import SwiftUI
import WidgetKit

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
                    // 立马刷新Widget
                    WidgetCenter.shared.reloadAllTimelines()
                    // 刷新某个类型的Widget
                    // WidgetCenter.shared.reloadTimelines(ofKind: "UserWidget")

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
