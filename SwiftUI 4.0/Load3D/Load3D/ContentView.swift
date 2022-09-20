//
//  ContentView.swift
//  Load3D
//
//  Created by 杨帆 on 2022/9/20.
//

import SwiftUI
import SceneKit
import SceneKit.ModelIO

class Model: ObservableObject {
    @Published var scene: SCNScene?
    
    init() {
       load3DModel()
    }
    
    private func load3DModel() {
        let url = Bundle.main.url(forResource: "test", withExtension: "usdz")!
        let asset = MDLAsset(url: url)
        asset.loadTextures()
        let scene = SCNScene(mdlAsset: asset)
        self.scene = scene
    }
}

struct SceneView: UIViewRepresentable {
    var scene: SCNScene
    
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        sceneView.scene = scene
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        uiView.scene = scene
    }
}

struct ContentView: View {
    @StateObject var model = Model()
    
    var body: some View {
        VStack {
            if let scene = model.scene {
                SceneView(scene: scene)
                    .frame(width: UIScreen.main.bounds.width, height: 360)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
