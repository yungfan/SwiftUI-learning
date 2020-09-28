//
//  Contact.swift
//  SwiftUI-Widget
//
//  Created by 杨帆 on 2020/6/25.
//

import Foundation

// 联系人
struct Contact: Identifiable, Codable {
    var id = UUID()
    var name: String
    var phone: String
    var address: String

    static func getContacts() -> [Contact] {
        let names = ["杨一", "刘二", "张三", "李四", "王五", "赵六", "钱七", "孙八", "朱九"]
        let phones = ["13800000000", "13822222222", "13833333333", "13844444444", "13855555555", "13866666666", "13877777777", "13888888888", "13899999999"]
        let addresses = ["安徽·安庆", "安徽·黄山", "山东·济南", "江苏·南京", "江苏·苏州", "浙江·杭州", "陕西·西安", "浙江·宁波", "山东·青岛"]

        var contacts = [Contact]()

        for i in 0 ..< names.count {
            let contact = Contact(name: names[i], phone: phones[i], address: addresses[i])

            contacts.append(contact)
        }
        return contacts
    }
}
