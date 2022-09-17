//
//  ContentView.swift
//  View-Grid
//
//  Created by 杨帆 on 2022/9/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid(alignment: .topLeading, horizontalSpacing: 10, verticalSpacing: 10) {
            GridRow {
                Text("One")
                
                ForEach(0 ..< 1) { _ in
                    Color.red
                }
            }
            
            
            GridRow(alignment: .center) {
                Text("Three")
                    .gridColumnAlignment(.trailing)
                
//                Color.clear
//                    .gridCellUnsizedAxes([.horizontal, .vertical])
                
                ForEach(0 ..< 3) { _ in
                    Color.green
                }
                .gridCellColumns(3)
            }
            
            GridRow {
                Text("Five")
                    .gridCellAnchor(.bottom)
                
                ForEach(0 ..< 5) { _ in
                    Color.blue
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
