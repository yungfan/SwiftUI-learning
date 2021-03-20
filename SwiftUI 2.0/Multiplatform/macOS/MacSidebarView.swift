//
//  MacSidebarView.swift
//  macOS
//
//  Created by 杨帆 on 2021/3/20.
//

import SwiftUI

struct MacSidebarView: View {
    var body: some View {
        NavigationView {
            List {
                // 标题
                Text("信智学院")
                    .font(.system(size: 23))
                    .bold()

                Spacer()

                Group {
                    NavigationLink(destination: Text("")) {
                        Label(NavMenu.Main, systemImage: NavMenu.MainIcon)
                    }

                    NavigationLink(destination: Text("")) {
                        Label(NavMenu.Teacher, systemImage: NavMenu.TeacherIcon)
                    }
                }

                Spacer()

                NavigationLink(destination: Text("")) {
                    Label(NavMenu.Major, systemImage: NavMenu.MajorIcon)
                }

                NavigationLink(destination: Text("")) {
                    Label(NavMenu.Lab, systemImage: NavMenu.LabIcon)
                }

                Divider()

                NavigationLink(destination: Text("")) {
                    Label(NavMenu.Science, systemImage: NavMenu.ScienceIcon)
                }

                NavigationLink(destination: Text("")) {
                    Label(NavMenu.More, systemImage: NavMenu.MoreIcon)
                }
            }
            .listStyle(SidebarListStyle())
            .toolbar {
                // 切换Sidebar
                ToolbarItem(placement: .navigation) {
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.left")
                            .foregroundColor(.accentColor)
                    })
                }
            }

            // macApp 首页可以多显示一项内容
            Text("学院介绍 macOS")
                .navigationTitle(NavMenu.Intro)
        }
    }

    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct MacSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        MacSidebarView()
    }
}
