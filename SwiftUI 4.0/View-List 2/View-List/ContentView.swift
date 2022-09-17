//
//  ContentView.swift
//  View-List
//
//  Created by 杨帆 on 2022/9/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List( 1 ..< 10) { index in
            HStack {
                Text("Row \(index)")
                
                Image(systemName: "\(index).square")
                    .alignmentGuide(.listRowSeparatorLeading) {
                        $0[.leading]
                    }
                
                Text("Row \(index)")
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
