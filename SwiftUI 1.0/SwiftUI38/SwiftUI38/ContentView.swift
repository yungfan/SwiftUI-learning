//
//  ContentView.swift
//  SwiftUI38
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI
import Combine

//class User: ObservableObject {
//
//    @Published var name: String = ""
//
//}
//
//struct ContentView: View {
//
//    @ObservedObject var user = User()
//
//    var body: some View {
//
//        VStack {
//
//            Text(user.name)
//
//            Button("改变name"){
//
//                self.user.name = "zhangsan"
//
//            }
//        }
//    }
//}


class User: ObservableObject {
    
    let objectWillChange = ObservableObjectPublisher()

    var name: String = "" {
        
        willSet {
            
            objectWillChange.send()
        }
        
    }

}

struct ContentView: View {

    @ObservedObject var user = User()

    var body: some View {

        VStack {
            
            TextField("请输入姓名", text: $user.name).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            

            Text(user.name)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
