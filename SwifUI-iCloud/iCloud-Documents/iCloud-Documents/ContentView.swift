//
//  ContentView.swift
//  iCloud-Documents
//
//  Created by 杨帆 on 2021/12/29.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        TextEditor(text: $viewModel.content)
            .foregroundColor(.black)
            .border(Color.gray, width: 1)
            .padding()
            .frame(height: 600)
        
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
