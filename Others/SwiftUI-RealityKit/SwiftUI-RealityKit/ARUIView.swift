//
//  ARUIView.swift
//  SwiftUI-RealityKit
//
//  Created by 杨帆 on 2021/3/31.
//

import SwiftUI

struct ARUIView: View {
    @EnvironmentObject var data: DataModel
    var body: some View {
        HStack {
            Toggle(isOn: $data.enableAR) {
                Text("AR")
            }
            Stepper("x轴: \(Int(data.xTranslation))", value: $data.xTranslation, in: -100 ... 100)
            Stepper("Y轴: \(Int(data.yTranslation))", value: $data.yTranslation, in: -100 ... 100)
            Stepper("z轴: \(Int(data.zTranslation))", value: $data.zTranslation, in: -100 ... 100)
        }.padding()
    }
}
