//
//  ContentView.swift
//  View05-Canvas
//
//  Created by 杨帆 on 2021/10/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Canvas { context, _ in
                context.draw(Text("Hello SwiftUI 3.0"), at: CGPoint(x: 100, y: 20))
            }

            Canvas { context, _ in
                context.draw(Image(systemName: "heart"), in: CGRect(x: 0, y: 50, width: 100, height: 100))
            }

            Canvas { context, size in
                context.fill(Path(ellipseIn: CGRect(origin: CGPoint.zero, size: size)), with: .color(Color.red))
            }
            .frame(width: 200, height: 150)
            .border(Color.blue)

            Canvas { context, size in
                context.stroke(Path(ellipseIn: CGRect(origin: .zero, size: size)), with: .color(Color.blue), lineWidth: 2)
            }
            .frame(width: 200, height: 150)
            .border(Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
