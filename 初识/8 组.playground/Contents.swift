import SwiftUI
import PlaygroundSupport

struct ContentView : View {
    
    var body: some View {
        
        VStack {
            
            Group {
                Text("Hello World !")
                Text("Hello World !")
                }
                .padding(5)
        
            
            Group {
                Text("Hello World !")
                Text("Hello World !")
                }.padding(5)
            
            Group {
                Text("Hello World !")
                Text("Hello World !")
                }.padding(5)
            
        }
    }
}

// 创建UIHostingController
let vc = UIHostingController(rootView: ContentView())
// UIHostingController赋值给liveView
PlaygroundPage.current.liveView = vc
