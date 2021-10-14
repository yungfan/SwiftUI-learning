//
//  ContentView.swift
//  View11-Button
//
//  Created by 杨帆 on 2021/10/10.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack {
            Button {
            } label: {
                Label("喜欢", systemImage: "heart")
            }
            .tint(Color.green)
            .buttonStyle(.plain)
            
            
            Button {
            } label: {
                Label("喜欢", systemImage: "heart")
            }
            .tint(Color.green)
            .buttonStyle(.bordered)
            
            Button {
            } label: {
                Label("喜欢", systemImage: "heart")
            }
            .tint(Color.green)
            .buttonStyle(.borderless)
            
            Button {
            } label: {
                Label("喜欢", systemImage: "heart")
            }
            .tint(Color.green)
            .buttonStyle(.borderedProminent)
            
            Button("cancel", role: .cancel) {
                
            }
            
            Button("delete", role: .destructive) {
                
            }
            
            Toggle("开关", isOn: $isOn)
                .toggleStyle(.button)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
