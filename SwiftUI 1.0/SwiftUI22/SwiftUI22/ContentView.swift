//
//  ContentView.swift
//  SwiftUI22
//
//  Created by 杨帆 on 2019/10/20.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var enableLogging = false
    var agreedToTerms = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("第一部分"), footer: Text("one")) {
                    Text("YungFan")
                    
                    Toggle(isOn: $enableLogging) {
                        Text("Enable Logging")
                    }
                }
                
                Section(header: Text("第二部分"), footer: Text("two")) {
                    Button("Save changes") {
                        
                    }
                }.disabled(!agreedToTerms) // 禁用
            }.navigationBarTitle(Text("Settings"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
