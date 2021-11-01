//
//  ContentView.swift
//  SwiftUI49-Contacts
//
//  Created by 杨帆 on 2019/10/23.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

// 保存点击的Contact
var selectedContact: Contact = Contact()

struct ContentView: View {
    @EnvironmentObject var cons: Contacts

    @State private var isPresented: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(cons.contacts) { contact in

                    Button(action: {
                        selectedContact = contact

                        self.isPresented = true

                    }) {
                        RowView(contact: contact)
                    }

                }.onDelete(perform: delete(at:))

            }.sheet(isPresented: $isPresented, content: {
                UpdateView(contact: selectedContact)
            })

                .navigationBarTitle("通讯录")
                .navigationBarItems(trailing: NavigationLink(destination: AddView(contact: Contact()), label: {
                    Image(systemName: "person.circle").font(.title)
                }))
        }
    }

    func delete(at: IndexSet) {
        if let at = at.first {
            cons.contacts.remove(at: at)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
