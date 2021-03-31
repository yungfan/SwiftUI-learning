//
//  ContentView.swift
//  SwiftUI-RealityKit
//
//  Created by 杨帆 on 2021/3/31.
//

import RealityKit
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var data: DataModel

    var body: some View {
        VStack {
            ARUIView()

            if data.enableAR {
                ARDisplayView()
            } else {
                Spacer()
            }
        }
    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
