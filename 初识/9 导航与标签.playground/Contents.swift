import SwiftUI
import PlaygroundSupport

struct ContentView : View {
    
    @State var index = 0 // 默认选中索引
    
    let imgs = ["hot","recommend","search","tag","setting"]
    
    var body: some View {
        
        VStack {
            
            NavigationView {
                Text("导航内容").bold().color(.orange).font(.largeTitle)
                }
                //标题
                .navigationBarTitle(Text("导航"))
                //items
                .navigationBarItems(trailing: Button(action: {
                    print("Tap")
                    
                }, label: {
                    Text("点击").color(.orange)
                }))
            
             TabbedView(selection: $index) {
                ForEach(0 ..< imgs.count) { item in
                    TabItemPage(index: item)
                        .tabItemLabel(Image(self.imgs[item]))
                        .tag(item)
                }
                }
            
            
        }
    }
}

struct TabItemPage: View {
    
    var index: Int
    
    var body: some View {
        
        ZStack {
            //显示具体的内容
            Rectangle().foregroundColor(Color.orange)
            VStack {
                Text("\(index)")
                    .color(.white)
                    .font(.system(size: 100, design: .rounded))
                    .bold()
                //图标 需要最新系统支持
                Image("icon")
                    .resizable()
                    .frame(width: 200,height: 200)
            }
        }
    }
}

// 创建UIHostingController
let vc = UIHostingController(rootView: ContentView())
// UIHostingController赋值给liveView
PlaygroundPage.current.liveView = vc
