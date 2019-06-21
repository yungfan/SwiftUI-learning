import SwiftUI
import PlaygroundSupport


struct ContentView : View {
    
    //UI在值发生更改时应该更新，则将变量指定为@State
    @State var r : Double
    @State var g : Double
    @State var b : Double
    @State var showAlert = false
    
    var body: some View {
        
        VStack {
            
            //一个圆显示颜色
            Circle().foregroundColor(Color(red: r, green: g, blue: b, opacity: 1.0)).frame(width:200, height: 200)
            
            
            
            //滑块，可以选择颜色，通过$引用@State变量的值
            ColorSlider(value: $r, textColor: .red)
            ColorSlider(value: $g, textColor: .green)
            ColorSlider(value: $b, textColor: .blue)
            
            
            //按钮点击弹出一个对话框
            Button(action: {
                
                self.showAlert = true
                
            }) {
                Text("点击获取颜色值")
                }
                .presentation($showAlert) {
                    
                    Alert(title: Text("当前RGB值"), message: Text("r:\(Int(r * 255.0)) g:\(Int(g * 255.0)) b:\(Int(b * 255.0))"))
            }
        }
        
    }
}

struct ColorSlider :View {
    
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        
        HStack{
            
            Text("0").color(textColor)
            Slider(value: $value, from: 0.0, through: 1.0, by: 0.1)
            Text("255").color(textColor)
            
            }
            .padding()
        
    }
}

let r = Double.random(in: 0..<1)
let g = Double.random(in: 0..<1)
let b = Double.random(in: 0..<1)

// 创建UIHostingController
let vc = UIHostingController(rootView: ContentView(r: r, g: g, b: b))
// UIHostingController赋值给liveView
PlaygroundPage.current.liveView = vc
