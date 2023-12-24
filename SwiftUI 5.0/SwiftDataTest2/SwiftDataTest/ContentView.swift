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
class Friend {
    var no: String
    var name: String
    @Relationship(deleteRule: .cascade)
    var company: Company
    @Relationship(deleteRule: .cascade) // 级联删除
    var hobby = [Hobby]()

    init(no: String = "", name: String = "", company: Company) {
        self.no = no
        self.name = name
        self.company = company
    }
}

@Model
class Company {
    var name: String
    var address: String

    init(name: String = "", address: String = "") {
        self.name = name
        self.address = address
    }
}

@Model
class Hobby {
    var name: String

    init(name: String = "") {
        self.name = name
    }
}

// MARK: - ContentView
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Friend.name, order: .forward, animation: .smooth) var friends: [Friend]
    @State private var path = [Friend]()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                if friends.isEmpty {
                    ContentUnavailableView("暂无数据，点击+添加数据", systemImage: "person.crop.circle.badge.exclamationmark.fill")
                } else {
                    List(friends) { friend in
                        NavigationLink(value: friend) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("\(friend.name)")
                                    .fontWeight(.bold)
                                    .font(.title2)

                                Text("公司: \(friend.company.name)")

                                Text("公司地址: \(friend.company.address)")
                                    .foregroundStyle(.gray)
                            }
                            .swipeActions {
                                Button("删除", role: .destructive) {
                                    modelContext.delete(friend)
                                }
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Friend.self) { friend in
                EditView(friend: friend)
            }
            .navigationTitle("名片")
            .toolbar {
                Button("Add", systemImage: "plus", action: addTodoItem)
            }
        }
    }

    func addTodoItem() {
        let friend = Friend(company: Company())
        modelContext.insert(friend)
        path = [friend]
    }
}

// MARK: - EditView
struct EditView: View {
    @Bindable var friend: Friend
    @State private var hobbyName = ""

    var body: some View {
        Form {
            Section {
                TextField("用户名", text: $friend.name)
            } header: {
                Text("基本信息")
            }

            Section {
                TextField("公司名", text: $friend.company.name)

                TextField("公司地址", text: $friend.company.address)
            } header: {
                Text("公司信息")
            }

            Section {
                ForEach(friend.hobby) { hobby in
                    Text(hobby.name)
                }

                HStack {
                    TextField("请输入兴趣爱好", text: $hobbyName)

                    Button("保存") {
                        addHobby()
                    }
                }
            } header: {
                Text("兴趣爱好")
            }
        }
        .padding()
        .navigationTitle(friend.name.isEmpty ? "添加" : "编辑")
        .navigationBarTitleDisplayMode(.inline)
    }

    func addHobby() {
        guard hobbyName.isEmpty == false else { return }
        withAnimation {
            let hobby = Hobby(name: hobbyName)
            friend.hobby.append(hobby)
            hobbyName = ""
        }
    }
}

#Preview {
    ContentView()
}
