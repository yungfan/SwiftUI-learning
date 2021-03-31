//
//  DataModel.swift
//  SwiftUI-RealityKit
//
//  Created by 杨帆 on 2021/3/31.
//

import Combine
import RealityKit

final class DataModel: ObservableObject {
    static var shared = DataModel()
    @Published var arView: ARView!
    @Published var enableAR = false
    @Published var xTranslation: Float = 0 {
        didSet { translateBox() }
    }

    @Published var yTranslation: Float = 0 {
        didSet { translateBox() }
    }

    @Published var zTranslation: Float = 0 {
        didSet { translateBox() }
    }

    init() {
        arView = ARView(frame: .zero)
        let boxAnchor = try! Experience.loadBox()
        arView.scene.anchors.append(boxAnchor)
    }

    func translateBox() {
        if let steelBox = (arView.scene.anchors[0] as? Experience.Box)?.steelBox {
            let xTranslationM = xTranslation / 100
            let yTranslationM = yTranslation / 100
            let zTranslationM = zTranslation / 100
            let translation = SIMD3<Float>(xTranslationM, yTranslationM, zTranslationM)
            steelBox.transform.translation = translation
        }
    }
}
