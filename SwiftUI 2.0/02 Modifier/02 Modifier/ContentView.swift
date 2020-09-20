//
//  ContentView.swift
//  02 Modifier
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = "ZHANGSAN"

    var body: some View {
        VStack {
            Spacer()
            TextField("请输入用户名", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textCase(.lowercase)
                .padding()

            Toggle(isOn: .constant(true), label: {
                Text("开关")
            }).toggleStyle(SwitchToggleStyle(tint: .red))
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
