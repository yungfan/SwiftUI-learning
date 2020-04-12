//
//  ListView.swift
//  SwiftUI-Login
//
//  Created by 杨帆 on 2020/4/12.
//  Copyright © 2020 杨帆. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var user: UserStore
    
    @State var isModal: Bool = false
    
    @State var showAlert: Bool = false
    
    let titles = ["2019.10.21", "2019.10.22","2019.10.23","2019.10.24","2019.10.25","2019.10.26","2019.10.27"]
    let subtitles = ["星期一", "星期二","星期三","星期四","星期五","星期六","星期日"]
    let details = ["下雨", "晴天","有雾","多云","阴天","下雪","大风"]
    
    var body: some View {
        
        NavigationView {
            // 登录状态展示数据 并且可以登出
            if user.isLogged {
                List(0..<self.titles.count) { item in
                    HStack {
                        VStack {
                            Text(self.titles[item])
                                .foregroundColor(.orange)
                                .bold()
                                .font(.system(.title))
                            
                            Text(self.subtitles[item])
                                .foregroundColor(.gray)
                                .font(.system(.title))
                        }.padding(.trailing, 50)
                        
                        Text(self.details[item])
                            .foregroundColor(.blue)
                            .font(.system(.largeTitle))
                            .italic()
                        
                    }.padding()
                }.navigationBarItems(trailing: Button(action: {
                    
                    self.showAlert = true
                    
                }, label: {
                    Image(systemName: "y.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                }).alert(isPresented: $showAlert, content: {
                    Alert(title: Text("提示"),
                          message: Text("确定退出吗？"),
                          primaryButton: .default(Text("确定"), action: {
                            self.user.isLogged = false
                          }),
                          secondaryButton: .cancel(Text("取消"))
                    )
                })
                    
                ).navigationBarTitle("天气")
            }
                
                // 未登录状态不现实数据 可以点击弹出登录界面
            else {
                EmptyView().navigationBarItems(trailing:
                    
                    Button(action: {
                        self.isModal = true
                        
                    }, label: {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 36, height: 36)
                        
                    }).sheet(isPresented: $isModal, content: {
                        // Modal出来的界面
                        // 后面的environmentObject(self.user)非常关键，不写会崩溃
                        LoginView().environmentObject(self.user)
                    })
                ).navigationBarTitle("暂无数据")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
