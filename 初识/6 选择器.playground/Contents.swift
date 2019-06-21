import SwiftUI
import PlaygroundSupport


struct ContentView : View {
    
   
    //开关的绑定
    @State var isOn: Bool = true
    //滑块的绑定
    @State var value: Double = 0.5
    //计步器的绑定
    @State var stepValue: Int = 0
    //分段控件的数据和当前索引
    @State var items = ["红","黄","紫"]
    @State var currentIndex = 0
    
    //日期选择器的默认时间
    @State var date = Date()
    
    //选择器的索引
    @State var index = 0
    //选择器的数据源
    let dataSource =  ["赤", "橙", "黄", "绿", "青", "蓝", "紫"]
    
    var body: some View {
        
        VStack {
            
            //开关
            Toggle(isOn: $isOn) {
                Text("State: \(self.isOn == true ? "开":"关")")
                }.padding(20)
            
            //滑块
            Slider(value: $value, from: 0.0, through: 1.0, by: 0.1)
            
            //计步器
            Stepper(value: self.$stepValue, step: 2, onEditingChanged: { c in
                print(c)
            }) {
                Text("计步器：\(self.stepValue)")
                }.padding()
            
            
            //分段
            SegmentedControl(selection: self.$currentIndex) {
                ForEach(0..<self.items.count) { index in
                    Text(self.items[index]).tag(index)
                }
                }.tapAction {
                    print("currentIndex: \(self.currentIndex)")
            }
            
            
            //日期
            Text("日期：\(self.date)").lineLimit(nil)
            DatePicker(self.$date, minimumDate: Calendar.current.date(byAdding: .year,
                                                                      value: -1,
                                                                      to: Date()), maximumDate: Calendar.current.date(byAdding: .year,
                                                                                                                         value: +1,
                                                                                                                         to: Date()), displayedComponents: .date) { () -> EmptyView in
                  EmptyView()

            }
            
            //选择器
            Picker(selection: $index, label: Text("选择器")) {
                ForEach(0..<dataSource.count) {
                    Text(self.dataSource[$0])
                }
            }
            
            }
            .padding()
        
    }
    
}

// 创建UIHostingController
let vc = UIHostingController(rootView: ContentView())
// UIHostingController赋值给liveView
PlaygroundPage.current.liveView = vc
