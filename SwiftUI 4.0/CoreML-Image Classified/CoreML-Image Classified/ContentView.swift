//
//  ContentView.swift
//  CoreML-Image Classified
//
//  Created by 杨帆 on 2022/9/22.
//

import SwiftUI
import PhotosUI
import Vision

@MainActor
class ImageModel: ObservableObject {
    @Published var image: Image?
    @Published var result = "点击选择图片"
    
    var pickItem: PhotosPickerItem? {
        didSet {
            if let pickItem {
                Task {
                    await loadTransferable(pickItem: pickItem)
                }
            }
        }
    }
    
    func loadTransferable(pickItem: PhotosPickerItem?) async {
        do {
            if let data = try await pickItem?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data), let ciImage = CIImage(data: data) {
                    image = Image(uiImage: uiImage)
                    
                    analyze(image: ciImage)
                }
            }
        }
        catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func analyze(image: CIImage) {
        do  {
            let model = try FruitImageClassifier(configuration: MLModelConfiguration())
            let visionModel = try VNCoreMLModel(for: model.model)
            let request = VNCoreMLRequest(model: visionModel) { request, _ in
                if let observations = request.results as? [VNClassificationObservation] {
                    self.result = observations.first?.identifier ?? "无法识别"
                }
            }
            
            request.imageCropAndScaleOption = VNImageCropAndScaleOption.scaleFill
            let handler = VNImageRequestHandler(ciImage: image)
            
            try handler.perform([request])
        }
        catch {
            print("\(error.localizedDescription)")
        }
       
    }
}

struct ContentView: View {
    @StateObject private var imageModel = ImageModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = imageModel.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding()
                }
                
                Text(imageModel.result)
            }
            .navigationTitle("图片识别")
            .toolbar {
                PhotosPicker(selection: $imageModel.pickItem, matching: .images, photoLibrary:.shared()) {
                    Image(systemName: "plus")
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
