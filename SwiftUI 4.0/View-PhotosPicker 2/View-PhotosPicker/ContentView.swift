//
//  ContentView.swift
//  View-PhotosPicker
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI
import PhotosUI

class ImageModel: ObservableObject {
    @Published var images: [Image] = []
    var pickItems: [PhotosPickerItem] = [] {
        didSet {
            for pickerItem in pickItems {
                loadTransferable(from: pickerItem)
            }
        }
    }
    
    func loadTransferable(from pickerItem: PhotosPickerItem) {
        pickerItem.loadTransferable(type: Image.self) { result in
            switch result {
            case let .success(image):
                if let image {
                    DispatchQueue.main.async {
                        self.images.append(image)
                    }
                }
            case let .failure(failure):
                print(failure)
            }
        }
    }
}

struct ContentView: View {
    @StateObject private var imageModel = ImageModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                if imageModel.images.count != 0 {
                    ForEach(0 ..< imageModel.images.count, id: \.self) { index in
                        imageModel.images[index]
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                }
            }
            .navigationTitle("选择照片")
            .toolbar {
                PhotosPicker(selection: $imageModel.pickItems,
                             maxSelectionCount: 3,
                             selectionBehavior: .ordered,
                             matching: .images,
                             photoLibrary: .shared()) {
                    Image(systemName: "plus.app")
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
