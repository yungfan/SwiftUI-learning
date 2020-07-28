//
//  ContentView.swift
//  SwiftUI-PHPicker
//
//  Created by 杨帆 on 2020/7/28.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    @State var pickerResult: [UIImage] = []
    var config: PHPickerConfiguration  {
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.filter = .images // 只取照片
        config.selectionLimit = 0 // 0表示不限制
        return config
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                Button("Present Picker") {
                    isPresented.toggle()
                }.sheet(isPresented: $isPresented) {
                    PhotoPicker(configuration: config,
                                pickerResult: $pickerResult,
                                isPresented: $isPresented)
                }
                
                ForEach(pickerResult, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 250, alignment: .center)
                        .aspectRatio(contentMode: .fit)
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
