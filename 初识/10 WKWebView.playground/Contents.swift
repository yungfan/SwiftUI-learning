import SwiftUI
import PlaygroundSupport
import WebKit

struct ContentView : View {
    
    @State var index = 0 // 默认选中索引
    
    let imgs = ["hot","recommend","search","tag","setting"]
    
    var body: some View {
        
        VStack {
            
            Text("WebView")
            
            WebView().frame(height:600)
            
        }
    }
}

//使用非SwiftUI中的控件 需要自己实现UIViewRepresentable协议，实现两个方法
struct WebView : UIViewRepresentable {
    
    //该方法创建一个控件
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    //该方法更新控件具体的工作
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        let req = URLRequest(url: URL(string: "https://www.abc.edu.cn")!)
        
        uiView.load(req)
    }
}

// 创建UIHostingController
let vc = UIHostingController(rootView: ContentView())
// UIHostingController赋值给liveView
PlaygroundPage.current.liveView = vc
