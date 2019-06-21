import SwiftUI
import PlaygroundSupport

struct ContentView : View {
    
    let titles = ["2019.06.17", "2019.06.18","2019.06.19","2019.06.20","2019.06.21","2019.06.22","2019.06.23"]
    let subtitles = ["星期一", "星期二","星期三","星期四","星期五","星期六","星期日"]
    let details = ["下雨", "晴天","有雾","多云","阴天","下雪","大风"]
    
    var body: some View {
        
        List(0..<7) { item in
            
            HStack {
                VStack {
                    
                    Text(self.titles[item])
                        .color(.orange)
                        .bold()
                        .font(.system(.title))
                    
                    Text(self.subtitles[item])
                        .color(.gray)
                        .font(.system(.subheadline))
                    
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                
                
                Text(self.details[item])
                    .color(.blue)
                    .font(.system(.largeTitle))
                    .italic()
                
                }.padding()
            
            
        }
    }
}

// 创建UIHostingController
let vc = UIHostingController(rootView: ContentView())
// UIHostingController赋值给liveView
PlaygroundPage.current.liveView = vc
