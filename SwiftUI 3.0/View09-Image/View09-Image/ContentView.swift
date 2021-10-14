//
//  ContentView.swift
//  View09-Image
//
//  Created by 杨帆 on 2021/10/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "person.3.sequence")
            .resizable()
            .frame(width: 100, height: 50)
            .foregroundStyle(.red, .blue, .green)
            .symbolRenderingMode(.palette)

        Image(systemName: "circle.hexagongrid.fill")
            .symbolRenderingMode(.multicolor)

        Image(systemName: "trash")
            .resizable()
            .frame(width: 100, height: 100)
            .symbolVariant(.circle)

        Image(systemName: "trash")
            .resizable()
            .frame(width: 100, height: 100)
            .symbolVariant(.fill)

        Image(systemName: "trash")
            .resizable()
            .frame(width: 100, height: 100)
            .symbolVariant(.rectangle)

        Image(systemName: "trash")
            .resizable()
            .frame(width: 100, height: 100)
            .symbolVariant(.slash)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
