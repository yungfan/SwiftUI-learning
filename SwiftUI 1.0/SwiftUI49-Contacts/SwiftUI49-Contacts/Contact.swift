//
//  Contact.swift
//  SwiftUI49-Contacts
//
//  Created by 杨帆 on 2019/10/23.
//  Copyright © 2019 杨帆. All rights reserved.
//

import Foundation


class Contact: ObservableObject, Identifiable {
    
    var id = UUID()
    
   @Published var name: String
   @Published  var phone: String
   @Published  var address: String
    
    
    init() {
        
        name = ""
        phone = ""
        address = ""
        
        
    }
    
    init(name: String, phone: String, address: String) {
        
        self.name = name
        self.phone = phone
        self.address = address
        
    }
    
}
