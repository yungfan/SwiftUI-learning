//
//  _6_ModifierApp.swift
//  06 Modifier
//
//  Created by 杨帆 on 2020/9/20.
//

import SwiftUI

@main
struct _6_ModifierApp: App {
    
    
    
    var body: some Scene {
        WindowGroup {
            if true {
                TabView {
                    Color.red.tabItem {
                        Image(systemName: "display")
                    }

                    Color.blue.tabItem {
                        Image(systemName: "iphone")
                    }

                    Color.green.tabItem {
                        Image(systemName: "ipad")
                    }

                    Color.purple.tabItem {
                        Image(systemName: "ipod")
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            } else {
                ContentView()
            }
        }
    }
}
