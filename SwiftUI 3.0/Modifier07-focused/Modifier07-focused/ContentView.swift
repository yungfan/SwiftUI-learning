//
//  ContentView.swift
//  Modifier07-focused
//
//  Created by 杨帆 on 2021/10/12.
//

import SwiftUI

enum Login: Hashable {
    case username
    case password
}

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @FocusState var focusState: Login?

    var body: some View {
        VStack {
            TextField("用户名", text: $username)
                .textFieldStyle(.roundedBorder)
                .submitLabel(.next)
                .submitScope(username.count < 6)
                .focused($focusState, equals: .username)

            SecureField("密码", text: $password)
                .textFieldStyle(.roundedBorder)
                .submitLabel(.done)
                .submitScope(password.count < 6)
                .focused($focusState, equals: .password)
        }
        .padding()
        .onSubmit {
            if username.isEmpty {
                focusState = .username
            } else if password.isEmpty {
                focusState = .password
            } else {
                print(username)
                print(password)
            }
        }

        Button("登录") {
        }
        .tint(.green)
        .buttonBorderShape(.capsule)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
