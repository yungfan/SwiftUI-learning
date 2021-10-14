//
//  ContentView.swift
//  Modifier18-openURL
//
//  Created by 杨帆 on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    let bd = URL(string: "https://www.baidu.com")!
    let wwdc21 = URL(string: "https://developer.apple.com/wwdc21/")!
    
    @Environment(\.openURL) var openURL

    var body: some View {
        Link("百度", destination: bd)
            .environment(\.openURL, OpenURLAction { url in
                .systemAction
            })
        
        Link("百度", destination: bd)
            .environment(\.openURL, OpenURLAction { url in
                
                handle(url: url)
                
                return .handled
            })
        
        Link("WWDC", destination: wwdc21)
            .environment(\.openURL, OpenURLAction { url in
                
                handle(url: url)
                
                return .discarded
            })
        
        Link("WWDC", destination: wwdc21)
            .environment(\.openURL, OpenURLAction { url in
            .systemAction(URL(string: "https://www.qq.com")!)
            })
    }
    
    func handle(url: URL) {
        openURL.callAsFunction(url) { accepted in
            print(accepted)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
