//
//  ARDisplayView.swift
//  SwiftUI-RealityKit
//
//  Created by 杨帆 on 2021/3/31.
//

import RealityKit
import SwiftUI

struct ARDisplayView: View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        return DataModel.shared.arView
    }

    func updateUIView(_ uiview: ARView, context: Context) {
    }
}
