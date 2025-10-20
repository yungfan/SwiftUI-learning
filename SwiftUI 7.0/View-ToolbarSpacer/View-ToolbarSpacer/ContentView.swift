//
//  ContentView.swift
//  View-ToolbarSpacer
//
//  Created by 杨帆 on 2025/08/14  14:50.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Color.orange.opacity(0.5)
                .ignoresSafeArea()
                .toolbar {
                    Toolbar()
                }
        }
    }
}

struct Toolbar: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
            } label: {
                Image(systemName: "trash")
            }
        }

        // 分割
        ToolbarSpacer(.fixed, placement: .topBarTrailing)

        ToolbarItem(placement: .topBarTrailing) {
            Button {
            } label: {
                Image(systemName: "square.and.pencil")
            }
        }

        ToolbarItem(placement: .topBarTrailing) {
            Button {
            } label: {
                Image(systemName: "text.justify")
            }
        }

        // 分割
        ToolbarSpacer(.flexible, placement: .topBarTrailing)

        ToolbarItem(placement: .topBarTrailing) {
            Button {
            } label: {
                Image(systemName: "photo")
            }
        }
    }
}

#Preview {
    ContentView()
}
