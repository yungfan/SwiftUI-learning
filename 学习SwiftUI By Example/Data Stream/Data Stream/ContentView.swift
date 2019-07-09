//
//  ContentView.swift
//  Data Stream
//
//  Created by 杨帆 on 2019/6/21.
//  Copyright © 2019 杨帆. All rights reserved.


//1.五个数据流工具
//Property - 视图直接访问数据属性，没有数据更新视图的逻辑，或数据更新后不需要同步视图
//@State - 视图和数据之间有依赖关系，数据变化要同步到视图的相应节点
//@Binding - 父子视图直接有视图和数据的依赖关系
//@BindableObject - 方便外部数据结构与 SwiftUI 建立数据依赖关系
//@EnvironmentObject - 跨组件快速访问全局数据源

//2.SwiftUI 种数据的流转过程如下：
//用户对界面进行操作，产生一个操作行为 action
//该行为触发数据改变，并通过 @State 对数据源进行包装
//@State 检测到数据变化，触发视图重绘
//SwiftUI 内部按需更新视图，最终再次呈现给用户，等待下次界面操作

//3.外部数据分为三类：
//系统级的消息
//网络或本地存储的数据结构
//界面之间互相传递的数据
//处理这些外部数据，SwiftUI 为我们提供了 Publisher、@ObjectBinding、@EnvironmentObject 三个工具

import SwiftUI


struct Episode {
    var title: String
    var showTitle: String
}

struct ContentView : View {
    
    let episode = Episode(title: "WWDC 2019", showTitle: "Data Flow Throght SwiftUI")
    
    @State var isPlaying: Bool = false
    
    var body: some View {
        
        VStack {
            
            Text(episode.title).foregroundColor(isPlaying ? .red:.blue)
            
            Text(episode.showTitle).font(.caption).foregroundColor(.gray)
            
            PlayerButton(isPlaying: $isPlaying)
        }
    }
}

struct PlayerButton : View {
    
    //1.在不持有数据源的情况下，任意读取 2.从 @State 中获取数据应用，并保持同步
    //第一个 Title Text 的颜色依赖了 isPlaying 属性，但是 isPlaying 属性的是在 PlayButton 子视图中改变的， 要想保持父子视图的数据源状态是同步的，就要使用 @Binding 修饰器，同时在 PlayView 中在 isPlaying 属性前添加 $ 符号，表示这是一个双向依赖关系
    @Binding var isPlaying: Bool
    
    var body: some View {
        return Button(action: {
            self.isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
