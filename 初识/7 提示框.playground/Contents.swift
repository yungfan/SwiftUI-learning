import SwiftUI
import PlaygroundSupport

struct ContentView : View {
    
    @State var showAlert = false
    
    var body: some View {
        
        Button(action: {
            
            print("Hello")
            
            self.showAlert = true
            
        }) {
            Text("弹出对话框")
            }.presentation($showAlert){
                
                Alert(title: Text("温馨提示"), message: Text("Hello 对话框"),
                      primaryButton: .destructive(Text("确认")) { print("ok") },
                      secondaryButton: .cancel())
            }
            .navigationBarTitle(Text("Alert"))
    }
}

// 创建UIHostingController
let vc = UIHostingController(rootView: ContentView())
// UIHostingController赋值给liveView
PlaygroundPage.current.liveView = vc
