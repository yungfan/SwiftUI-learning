import SwiftUI
import PlaygroundSupport

struct ContentView : View {
    
    var body: some View {
    
    VStack {
    
    Rectangle().foregroundColor(Color.red)
        
    //空隙
    Spacer().foregroundColor(Color.red)
    
    RoundedRectangle(cornerSize: CGSize(width: 10,height: 10)).foregroundColor(Color.blue).frame(height:200)
    

    //分割线
    Divider()
    
    Circle().foregroundColor(Color.yellow)
    
    Ellipse().foregroundColor(Color.pink).frame(height:200)
    
    }
    .padding()
    
    
    }
}

// 创建UIHostingController
let vc = UIHostingController(rootView: ContentView())
// UIHostingController赋值给liveView
PlaygroundPage.current.liveView = vc
