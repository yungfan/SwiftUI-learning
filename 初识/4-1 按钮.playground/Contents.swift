import SwiftUI
import PlaygroundSupport

struct ContentView : View {
    @State var count = 0;
    
    var body: some View {
        VStack{
            Text(String(count))
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: 50
                )
                .background(Color.blue)
                .foregroundColor(Color.yellow)
                .padding(10)
            
            Button(
                action:{self.increment()},
                label: {Text("increment")}
            )
            
            Button(
                action: {self.decrement()},
                label: {Text("decrement")}
            )
        }
    }
    
    func increment() {
        count = count + 1
    }
    
    func decrement() {
        count = count - 1
    }
}

// 创建UIHostingController
let vc = UIHostingController(rootView: ContentView())
// UIHostingController赋值给liveView
PlaygroundPage.current.liveView = vc
