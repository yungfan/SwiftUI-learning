import SwiftUI
import PlaygroundSupport

struct ContentView : View {
    
    var body: some View {
        
        NavigationButton(destination: ContentView()) {
            Text("导航按钮").bold()
                .color(.orange)
                .font(.largeTitle)
            }.tapAction {
                print("Tap")
        }
    }
}

// 创建UIHostingController
let vc = UIHostingController(rootView: ContentView())
// UIHostingController赋值给liveView
PlaygroundPage.current.liveView = vc
