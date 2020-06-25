//
//  ListItemView.swift
//  SwiftUI-Widget
//
//  Created by 杨帆 on 2020/6/25.
//

import SwiftUI


struct ListItemView: View {
    
    var contact:Contact
    
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle()) //圆形图片
                .foregroundColor(.green)
            
            Spacer()
            
            VStack {
                
                Text(contact.name)
                    .foregroundColor(.secondary)
                    .bold()
                    .font(.title)
                
                Text(contact.phone)
                    .foregroundColor(.accentColor)
                    .font(.system(size: 15))
            }
            
            Spacer()
            
            Text(contact.address)
                .foregroundColor(.primary)
                .font(.system(.title))
        }.padding()
         .background(RoundedRectangle(cornerRadius: 10)
         .foregroundColor(.orange))
    }
}
