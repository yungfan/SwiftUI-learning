//
//  ContentView.swift
//  02 View
//
//  Created by 杨帆 on 2020/9/19.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    @State private var input: String = ""

    var body: some View {
        VStack {
            TextEditor(text: $input)
                .border(Color.primary, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
            
            SignInWithAppleButton(.signIn) { request in
                request.requestedScopes = [.fullName, .email]
            } onCompletion: { result in
                switch result {
                case .success(let suc):
                    print("授权成功\(suc)")
                case .failure(let err):
                    print("授权失败\(err)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
