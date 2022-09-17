//
//  ContentView.swift
//  Modifier-presentationDetents
//
//  Created by 杨帆 on 2022/9/17.
//

import SwiftUI

struct CustomDetent: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        return max(300, context.maxDetentValue * 0.15)
    }
}

struct ContentView: View {
    @State private var isModal = false
    @State private var selection = PresentationDetent.large

    var body: some View {
        VStack {
            Button("Modal") {
                isModal = true
            }
            .sheet(isPresented: $isModal) {
                ZStack {
                    Color.orange

                    Button("Dismiss") {
                        isModal = false
                    }
                }
                .presentationDetents([
                    .medium,
                    .large,
                    .fraction(0.75),
                    .height(200),
                    .custom(CustomDetent.self),
                ], selection: $selection)
                // .presentationDragIndicator(.hidden)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
