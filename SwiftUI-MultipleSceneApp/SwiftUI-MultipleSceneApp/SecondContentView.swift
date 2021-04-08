//
//  SecondContentView.swift
//  SwiftUI-MultipleSceneApp
//
//  Created by 杨帆 on 2021/4/8.
//

import SwiftUI

struct SecondContentView: View {
    @Environment(\.sceneSession) private var sceneSession: UISceneSession?

    var body: some View {
        NavigationView {
            Text("副Scene")
                .navigationTitle("副页")
                .navigationBarItems(trailing:
                    // 关闭Scene
                    Button(action: {
                        UIApplication.shared.requestSceneSessionDestruction(
                            sceneSession!,
                            options: nil,
                            errorHandler: nil
                        )
                    }, label: {
                        Image(systemName: "xmark")
                    }))

        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SecondContentView_Previews: PreviewProvider {
    static var previews: some View {
        SecondContentView()
    }
}
