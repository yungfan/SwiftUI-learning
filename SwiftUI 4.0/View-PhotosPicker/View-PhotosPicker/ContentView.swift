//
//  ContentView.swift
//  View-PhotosPicker
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var pickerItem: PhotosPickerItem?
    @State private var image: Image?
    
    var body: some View {
        NavigationView {
            VStack {
                if let image {
                    image
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
            }
            .navigationTitle("选择照片")
            .toolbar {
                PhotosPicker(selection: $pickerItem) {
                    Image(systemName: "plus.app")
                }
            }
            .onChange(of: pickerItem) { newValue in
                if let newValue {
                    loadTransferable(from: newValue)
                }
            }
        }
    }
    
    func loadTransferable(from pickerItem: PhotosPickerItem) {
        pickerItem.loadTransferable(type: Image.self) { result in
            switch result {
            case let .success(image):
                if let image {
                    self.image = image
                }
            case let .failure(failure):
                print(failure)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
