//
//  UserWidget.swift
//  UserWidget
//
//  Created by 杨帆 on 2020/6/25.
//

import SwiftUI
import WidgetKit

struct UserProvider: TimelineProvider {
    // 占位视图，是一个标准的 SwiftUI View，当第一次展示或者发生错误时都会展示该 View。
    func placeholder(in context: Context) -> ContactEntry {
        let contact = Contact(name: "Yungfan", phone: "18111111111", address: "安徽·芜湖")
        return ContactEntry(date: Date(), contact: contact)
    }

    @AppStorage("contact", store: UserDefaults(suiteName: "group.cn.abc.yf.SwiftUI-Widget"))

    var contactData = Data()

    func getSnapshot(in context: Context, completion: @escaping (ContactEntry) -> Void) {
        // 取数据
        guard let contact = try? JSONDecoder().decode(Contact.self, from: contactData) else { return }
        let entry = ContactEntry(date: Date(), contact: contact)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ContactEntry>) -> Void) {
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

struct UserWidgetEntryView: View {
    var entry: UserProvider.Entry

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
        StaticConfiguration(kind: kind, provider: UserProvider()) { entry in
            UserWidgetEntryView(entry: entry)
        }.supportedFamilies([.systemSmall, .systemMedium, .systemLarge]) // 默认中
    }
}
