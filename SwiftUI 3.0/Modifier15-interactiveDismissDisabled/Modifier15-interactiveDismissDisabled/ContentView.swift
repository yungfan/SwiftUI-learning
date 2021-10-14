//
//  ContentView.swift
//  Modifier15-interactiveDismissDisabled
//
//  Created by 杨帆 on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false

    var body: some View {
        Button("弹出新界面") {
            show.toggle()
        }
        .sheet(isPresented: $show) {
            DetailView()
        }
    }
}

struct DetailView: View {
//    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("消失") {
            // presentationMode.wrappedValue.dismiss()
            dismiss()
        }
        .interactiveDismissDisabled(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
