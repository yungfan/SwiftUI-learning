//
//  ContentView.swift
//  CustomTabView
//
//  Created by 杨帆 on 2020/5/22.
//  Copyright © 2020 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewRouter = ViewRouter()
    
    @State var showPopUp = false
    
    var body: some View {
        GeometryReader { geometry in
            // spacing: 0 去除默认的空隙
            VStack(spacing: 0) {
                
                // 上面显示的内容
                if self.viewRouter.currentView == "home" {
                    Color.red
                } else if self.viewRouter.currentView == "settings" {
                    Color.blue
                } else if self.viewRouter.currentView == "paperplane" {
                    Color.green
                } else if self.viewRouter.currentView == "globe" {
                    Color.gray
                }
                
                // 底部自定义Tab
                ZStack {
                    // 水平5个菜单
                    HStack {
                        Image(systemName: "house")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(25)
                            .frame(width: geometry.size.width/5, height: geometry.size.height)
                            .foregroundColor(self.viewRouter.currentView == "home" ? .blue : .gray)
                            .onTapGesture {
                                self.viewRouter.currentView = "home"
                        }
                        
                        Image(systemName: "paperplane")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(25)
                            .frame(width: geometry.size.width/5, height: geometry.size.height)
                            .foregroundColor(self.viewRouter.currentView == "paperplane" ? .blue : .gray)
                            .onTapGesture {
                                self.viewRouter.currentView = "paperplane"
                        }
                        
                        // 中间的+菜单
                        ZStack {
                            Circle()
                                .foregroundColor(Color.white)
                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                                .foregroundColor(.orange)
                                .rotationEffect(Angle(degrees: self.showPopUp ? 90 : 0))
                        }
                        .offset(y: -geometry.size.height/32)
                        .onTapGesture {
                            withAnimation {
                                self.showPopUp.toggle()
                            }
                        }
                        
                        Image(systemName: "gear")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(25)
                            .frame(width: geometry.size.width/5, height: geometry.size.height)
                            .foregroundColor(self.viewRouter.currentView == "settings" ? .blue : .gray)
                            .onTapGesture {
                                self.viewRouter.currentView = "settings"
                        }
                        
                        
                        Image(systemName: "globe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(25)
                            .frame(width: geometry.size.width/5, height: geometry.size.height)
                            .foregroundColor(self.viewRouter.currentView == "globe" ? .blue : .gray)
                            .onTapGesture {
                                self.viewRouter.currentView = "globe"
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/12)
                    .background(Color.white.shadow(radius: 1))
                }
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
