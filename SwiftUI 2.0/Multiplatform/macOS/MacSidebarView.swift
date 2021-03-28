//
//  MacSidebarView.swift
//  macOS
//
//  Created by 杨帆 on 2021/3/20.
//

import SwiftUI

struct MacSidebarView: View {
    // 默认选中
    @State private var isDefaultItemActive = true

    var body: some View {
        NavigationView {
            List {
                // 标题
                Text("信智学院")
                    .font(.title)
                    .foregroundColor(.primary)

                Spacer()

                Group {
                    NavigationLink(destination: Text(NavMenu.Main), isActive: $isDefaultItemActive) {
                        Label(NavMenu.Main, systemImage: NavMenu.MainIcon)
                    }

                    NavigationLink(destination: Text("")) {
                        Label(NavMenu.Teacher, systemImage: NavMenu.TeacherIcon)
                    }
                }

                Spacer()

                NavigationLink(destination: Text(NavMenu.Major)) {
                    Label(NavMenu.Major, systemImage: NavMenu.MajorIcon)
                }

                NavigationLink(destination: Text(NavMenu.Lab)) {
                    Label(NavMenu.Lab, systemImage: NavMenu.LabIcon)
                }

                Divider()

                NavigationLink(destination: Text(NavMenu.Science)) {
                    Label(NavMenu.Science, systemImage: NavMenu.ScienceIcon)
                }

                NavigationLink(destination: Text(NavMenu.More)) {
                    Label(NavMenu.More, systemImage: NavMenu.MoreIcon)
                }
            }
            .listStyle(SidebarListStyle())
            .toolbar {
                // 切换Sidebar
                Button(action: toggleSidebar, label: {
                    Image(systemName: "sidebar.left")
                        .foregroundColor(.accentColor)
                })
            }

            // macApp 首页可以多显示一项内容
            Text("学院介绍 macOS")
                .navigationTitle(NavMenu.Intro)
        }
    }

    // 切换sideBar
    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct MacSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        MacSidebarView()
    }
}
