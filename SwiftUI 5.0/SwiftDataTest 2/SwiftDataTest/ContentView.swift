//
//  ContentView.swift
//  SwiftDataTest
//
//  Created by 杨帆 on 2023/6/6.
//

import SwiftData
import SwiftUI

// MARK: - 模型
@Model
class User {
    var id: UUID
    var name: String
    var company: Company

    init(name: String, company: Company) {
        id = UUID()
        self.name = name
        self.company = company
    }
}

@Model
class Company {
    @Attribute(.unique)
    var id: String
    var name: String
    var address: String

    init(id: String, name: String, address: String) {
        self.id = id
        self.name = name
        self.address = address
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \User.name, order: .forward, animation: .smooth) var users: [User]

    var body: some View {
        VStack {
            if users.isEmpty {
                ContentUnavailableView("暂无数据，点击+添加用户", systemImage: "person.crop.circle.badge.exclamationmark.fill")
            } else {
                List(users) { user in
                    NavigationLink {
                        EditUserView(user: user)
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(user.name)")
                                .fontWeight(.bold)
                                .font(.title)

                            Text("公司: \(user.company.name)")

                            Text("公司地址: \(user.company.address)")
                                .foregroundStyle(.gray)
                        }
                        .swipeActions {
                            Button("删除", role: .destructive) {
                                modelContext.delete(user)
                                do {
                                    try modelContext.save()
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                        }
                    }
                }
            }
        }
        .toolbar {
            NavigationLink {
                AddUserView()
            } label: {
                Text("+")
                    .font(.title)
            }
        }
    }
}

// MARK: - 添加View
struct AddUserView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var companyName: String = ""
    @State private var companyAddress: String = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("用户名", text: $name)
                .textFieldStyle(.roundedBorder)

            TextField("公司名", text: $companyName)
                .textFieldStyle(.roundedBorder)

            TextField("公司地址", text: $companyAddress)
                .textFieldStyle(.roundedBorder)

            Spacer()
        }
        .padding(20)
        .navigationTitle("Create User")
        .toolbar {
            Button {
                let user = User(name: name, company: Company(id: "1", name: companyName, address: companyAddress))
                modelContext.insert(user)
                do {
                    try modelContext.save()
                    dismiss()
                } catch {
                    print(error.localizedDescription)
                }
            } label: {
                Text("保存")
            }
        }
    }
}

// MARK: - 编辑View
struct EditUserView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @State var user: User

    var body: some View {
        VStack(spacing: 20) {
            TextField("用户名", text: $user.name)
                .textFieldStyle(.roundedBorder)

            TextField("公司名", text: $user.company.name)
                .textFieldStyle(.roundedBorder)

            TextField("公司地址", text: $user.company.address)
                .textFieldStyle(.roundedBorder)

            Spacer()
        }
        .padding(20)
        .navigationTitle("编辑用户")
        .toolbar {
            Button {
                dismiss()
            } label: {
                Text("更新")
            }
        }
    }
}

#Preview {
    ContentView()
}
