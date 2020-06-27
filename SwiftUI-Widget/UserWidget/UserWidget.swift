//
//  UserWidget.swift
//  UserWidget
//
//  Created by 杨帆 on 2020/6/25.
//

import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    @AppStorage("contact", store: UserDefaults(suiteName: "group.cn.abc.yf.SwiftUI-Widget"))

    var contactData = Data()
    
    func snapshot(with context: Context, completion: @escaping (ContactEntry) -> Void) {
        // 取数据
        guard let contact = try? JSONDecoder().decode(Contact.self, from: contactData) else { return }
        let entry = ContactEntry(date: Date(), contact: contact)
        completion(entry)
    }

    func timeline(with context: Context, completion: @escaping (Timeline<ContactEntry>) -> Void) {
        guard let contact = try? JSONDecoder().decode(Contact.self, from: contactData) else { return }
        let entry = ContactEntry(date: Date(), contact: contact)
        // policy决定了什么时候刷新数据
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct ContactEntry: TimelineEntry {
     let date: Date
     let contact: Contact
}

struct PlaceholderView: View {
    let contact = Contact(name: "Yungfan", phone: "18111111111", address: "安徽·芜湖")

    var body: some View {
        ListItemView(contact: contact)
    }
}

struct UserWidgetEntryView: View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            // 小
            ZStack {
                ContainerRelativeShape()
                    .inset(by: 4)
                    .fill(Color.blue)
                
                VStack(spacing: 10) {
                    Text(entry.contact.name)
                    Text(entry.contact.address)
                    Text(entry.contact.phone)
                }
            }

        case .systemMedium:
            // 中
            ZStack {
                ContainerRelativeShape()
                    .inset(by: 4)
                    .fill(Color.orange)
                
                VStack(spacing: 10) {
                    Text("联系人")
                    ListItemView(contact: entry.contact)
                }
            }
            
            
        default:
            // 大
            VStack {
                ZStack {
                    ContainerRelativeShape()
                        .inset(by: 4)
                        .fill(Color.red)
                    
                    VStack(spacing: 10) {
                        Text("联系人")
                        ListItemView(contact: entry.contact)
                        Text("Large")
                    }
                }
            }
        }
    }
}

@main
struct UserWidget: Widget {
    private let kind: String = "UserWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            UserWidgetEntryView(entry: entry)
        }.supportedFamilies([.systemMedium]) // 默认中
    }
}
