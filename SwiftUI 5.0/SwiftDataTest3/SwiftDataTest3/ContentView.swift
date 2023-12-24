//
//  ContentView.swift
//  SwiftDataTest3
//
//  Created by 杨帆 on 2023/12/24.
//

import PhotosUI
// 1
import SwiftData
import SwiftUI

// 2
// MARK: - 模型，必须是class
@Model
class Contact {
    var name: String
    // 外部存储：将图片存储为单独的文件，然后从数据库中引用它们的文件名
    @Attribute(.externalStorage)
    var photo: Data?

    init(name: String) {
        self.name = name
    }
}

// MARK: - ContentView
struct ContentView: View {
    // 4
    @Environment(\.modelContext) private var modelContext
    @State private var path = [Contact]()

    var body: some View {
        NavigationStack(path: $path) {
            ContactListView()
                .navigationDestination(for: Contact.self) { contact in
                    EditView(contact: contact)
                }
                .navigationTitle("Contacts")
                .toolbar {
                    Button("Add", systemImage: "plus", action: addContact)
                }
        }
    }

    // MARK: 5.1 增加
    func addContact() {
        let contact = Contact(name: "Xxx")
        modelContext.insert(contact)
    }
}

// MARK: - ContactListView
struct ContactListView: View {
    @Environment(\.modelContext) private var modelContext
    // 6
    @Query private var contacts: [Contact]

    var body: some View {
        if contacts.isEmpty {
            ContentUnavailableView.search
        } else {
            List {
                ForEach(contacts) { contact in
                    NavigationLink(value: contact) {
                        // 对齐分割线
                        Text("")

                        HStack {
                            if let imageData = contact.photo, let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                            }

                            Spacer()

                            Text(contact.name)
                        }
                    }
                }
                .onDelete(perform: deleteContact)
            }
        }
    }

    // MARK: 5.2 删除
    func deleteContact(_ indexSet: IndexSet) {
        indexSet.forEach { index in
            let contact = contacts[index]
            modelContext.delete(contact)
        }
    }
}

// MARK: - EditView
struct EditView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectedItem: PhotosPickerItem?
    @Bindable var contact: Contact

    var body: some View {
        Form {
            // 5.3 修改
            TextField("输入姓名", text: $contact.name)

            PhotosPicker(selection: $selectedItem, matching: .images) {
                Text("选择照片")
            }
        }
        .onChange(of: selectedItem, loadPhoto)
        .padding()
        .navigationTitle("编辑")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: 获取图片
    func loadPhoto() {
        Task { @MainActor in
            contact.photo = try await selectedItem?.loadTransferable(type: Data.self)
        }
    }
}

// MARK: - 预览
#Preview {
    ContentView()
}
