//
//  RowView.swift
//  SwiftUI49-Contacts
//
//  Created by 杨帆 on 2019/10/23.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct RowView: View {
    
   @ObservedObject  var contact: Contact
    
    var body: some View {
        
        
        HStack {
            
            Image(systemName: "person.fill").resizable().clipShape(Circle()).frame(width: 60, height: 60).foregroundColor(.green)
            
            Spacer()
            
            VStack {
                
                Text(contact.name).font(.largeTitle).foregroundColor(.secondary)
                Text(contact.phone).foregroundColor(.accentColor)
                
            }
            
            Spacer()
            Text(contact.address).font(.largeTitle).foregroundColor(.primary)
        }.padding().background(RoundedRectangle(cornerRadius: 10).foregroundColor(.orange))
        
    }
}

