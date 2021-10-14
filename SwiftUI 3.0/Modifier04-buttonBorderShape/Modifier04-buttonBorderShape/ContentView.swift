//
//  ContentView.swift
//  Modifier04-buttonBorderShape
//
//  Created by 杨帆 on 2021/10/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
        } label: {
            Label("喜欢", systemImage: "heart")
        }
        .tint(.green)
        .buttonStyle(.bordered)
        
        Button {
        } label: {
            Label("喜欢", systemImage: "heart")
        }
        .tint(.green)
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
        
        Button {
        } label: {
            Label("喜欢", systemImage: "heart")
        }
        .tint(.green)
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle(radius: 10))
        
        Button {
        } label: {
            Label("喜欢", systemImage: "heart")
        }
        .tint(.green)
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle(radius: 10))
        .controlSize(.large)
        
        Button {
        } label: {
            Label("喜欢", systemImage: "heart")
        }
        .tint(.green)
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle(radius: 10))
        .controlSize(.regular)
        
        Button {
        } label: {
            Label("喜欢", systemImage: "heart")
        }
        .tint(.green)
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle(radius: 10))
        .controlSize(.small)
        
        Button {
        } label: {
            Label("喜欢", systemImage: "heart")
        }
        .tint(.green)
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle(radius: 10))
        .controlSize(.mini)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
