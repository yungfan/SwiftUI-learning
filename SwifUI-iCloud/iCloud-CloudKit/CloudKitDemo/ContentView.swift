//
//  ContentView.swift
//  CloudKitDemo
//
//  Created by 杨帆 on 2021/12/14.
//

import CloudKit
import SwiftUI

struct Person: Hashable {
    let id = UUID()
    let recordID: CKRecord.ID
    let name: String
    let age: String
    let sex: String
}

class ViewModel: ObservableObject {
    // identifier与Capability的Container保持一致
    private let database = CKContainer(identifier: "iCloud.cn.abc.yf.container").publicCloudDatabase

    @Published var person = [Person]()

    // 增加
    func add(person: Person) {
        let record = CKRecord(recordType: "Person", recordID: person.recordID)
        record.setValue(person.name, forKey: "name")
        record.setValue(person.age, forKey: "age")
        record.setValue(person.sex, forKey: "sex")

        // save保存记录
        database.save(record) { record, error in
            if record != nil, error == nil {
                print("saved")
                self.query()
            } else {
                print(error.debugDescription)
            }
        }
    }

    // 修改
    func update(person: Person) {
        database.fetch(withRecordID: person.recordID) { record, error in
            guard let record = record, error == nil else { return }
            // 修改记录
            record.setValue(person.name, forKey: "name")
            record.setValue(person.age, forKey: "age")
            record.setValue(person.sex, forKey: "sex")

            // 保存记录
            self.database.save(record) { record, error in
                if record != nil, error == nil {
                    print("updated")
                    self.query()
                } else {
                    print(error.debugDescription)
                }
            }
        }
    }

    // 删除
    func delete(person: Person) {
        // 删除记录
        database.delete(withRecordID: person.recordID) { _, error in
            if error != nil {
                print(error.debugDescription)
            } else {
                print("deleted")
                self.query()
            }
        }
    }

    // 查询
    func query() {
        let query = CKQuery(recordType: "Person", predicate: NSPredicate(value: true))
        database.perform(query, inZoneWith: nil) { records, error in
            guard let records = records, error == nil else { return }
            // 查询以后解析出数据
            DispatchQueue.main.async {
                let sortedRecords = records.sorted {
                    $0.creationDate! < $1.creationDate!
                }
                self.person = sortedRecords.compactMap { record in
                    Person(recordID: record.recordID, name: record.value(forKey: "name") as! String, age: record.value(forKey: "age") as! String, sex: record.value(forKey: "sex") as! String)
                }
            }
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State private var name = ""
    @State private var age = "10"
    @State private var sex = "男"
    @State private var type = true
    @State private var updateRecordID: CKRecord.ID!

    var body: some View {
        HStack {
            TextField("用户名", text: $name)
                .textFieldStyle(.roundedBorder)
                .disabled(!type)

            TextField("年龄", text: $age)
                .textFieldStyle(.roundedBorder)

            TextField("性别", text: $sex)
                .textFieldStyle(.roundedBorder)

            Button(type ? "保存" : "更新") {
                if type {
                    let recordID = CKRecord.ID(recordName: UUID().uuidString)
                    let p = Person(recordID: recordID, name: name, age: age, sex: sex)
                    viewModel.add(person: p)
                } else {
                    let p = Person(recordID: updateRecordID, name: name, age: age, sex: sex)
                    viewModel.update(person: p)
                    type = true
                }
            }
        }
        .padding()

        List {
            ForEach(viewModel.person, id: \.self) { p in
                HStack {
                    Text(p.name)

                    Spacer()

                    Text(p.age)

                    Text(p.sex)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button("删除", role: .destructive) {
                        viewModel.person.removeAll { person in
                            p.recordID == person.recordID
                        }
                        viewModel.delete(person: p)
                    }

                    Button("更新") {
                        updateRecordID = p.recordID
                        name = p.name
                        age = p.age
                        sex = p.sex
                        type = false
                    }
                    .tint(.green)
                }
            }
        }
        .task {
            viewModel.query()
        }
        .refreshable {
            viewModel.query()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
