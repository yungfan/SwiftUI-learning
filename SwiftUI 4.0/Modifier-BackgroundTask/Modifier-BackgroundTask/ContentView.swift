//
//  ContentView.swift
//  Modifier-BackgroundTask
//
//  Created by 杨帆 on 2022/9/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            switch UIApplication.shared.backgroundRefreshStatus {
            case .available:
                print("开启")
            case .denied:
                print("禁用")
            case .restricted:
                print("限制")
            default:
                print("未知")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
