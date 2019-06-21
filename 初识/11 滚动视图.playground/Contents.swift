import SwiftUI
import PlaygroundSupport

struct ContentView : View {
    
    var body: some View {
        
        ScrollView(isScrollEnabled: true, alwaysBounceHorizontal: false, alwaysBounceVertical: false, showsHorizontalIndicator: false, showsVerticalIndicator:false) {
            Text("SwiftUI").padding(20)
            Divider()
            Rectangle()
                .foregroundColor(.orange)
                .frame(width: UIScreen.main.bounds.size.width * 0.5, height: 1500, alignment: .center)
            Divider()
            Text("Example")
        }
        .padding()
    }
}

// 创建UIHostingController
let vc = UIHostingController(rootView: ContentView())
// UIHostingController赋值给liveView
PlaygroundPage.current.liveView = vc
