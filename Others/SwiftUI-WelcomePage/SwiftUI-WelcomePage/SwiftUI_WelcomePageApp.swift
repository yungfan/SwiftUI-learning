//
//  SwiftUI_WelcomePageApp.swift
//  SwiftUI-WelcomePage
//
//  Created by 杨帆 on 2020/6/27.
//

import SwiftUI

// 当前版本号
private var currentVersion = Double(Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String)!

@main
struct SwiftUI_WelcomePageApp: App {
    
    // 本地版本号
    @AppStorage("localVersion") var localVersion: Double = 0
    
    var body: some Scene {
        WindowGroup {
            if localVersion < currentVersion {
                TabView {
                    HomeView()
                    
                    AccountView()
                    
                    ProfileView()
                    
                    SettingsView(localVersion: $localVersion)
                        
                }
                .tabViewStyle(PageTabViewStyle())
            }
            else {
                ContentView()
            }
        }
    }
}

// 四个子页面
struct HomeView: View {
    
    var body: some View {
        Color.red
    }
}

struct AccountView: View {
    
    var body: some View {
        Color.orange
    }
}

struct ProfileView: View {
    
    var body: some View {
        Color.blue
    }
}

struct SettingsView: View {
    
    @Binding var localVersion: Double
    
    var body: some View {
        
        ZStack {
            Color.green
            
            VStack {
                Spacer()
                
                // 最后一个界面点击按钮的时候保存版本号
                Button("进入主界面") {
                    localVersion = currentVersion
                }
                .padding()
                .background(Color.orange)
                .cornerRadius(20)
                .padding(.vertical, 50)
            }
        }
    }
}
