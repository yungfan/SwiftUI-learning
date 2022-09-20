//
//  ContentView.swift
//  DynamicIsland
//
//  Created by 杨帆 on 2022/9/20.
//

import SwiftUI

struct DynamicIslandView: View {
    @Binding var expanded: Bool
    
    var body: some View {
        VStack {
            HStack {
                if expanded {
                    Image(systemName: "swift")
                        .foregroundStyle(.white)
                        .padding(10)
                    
                    Spacer()
                    
                    Image(systemName: "airpodspro")
                        .foregroundStyle(.white)
                        .padding(10)
                }
            }
        }
        .frame(maxWidth: expanded ? 280 : 130 , minHeight: expanded ? 50 : 40)
        .background(
            expanded ? .teal : .red
        )
        .onTapGesture {
            withAnimation(.linear(duration: 0.5)) {
                expanded.toggle()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 40.0, style: .continuous))
    }
}

struct ContentView: View {
    @State private var expanded  = false
    var body: some View {
        DynamicIslandView(expanded: $expanded)
            .position(x: UIScreen.main.bounds.midX, y: 29)
            .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
