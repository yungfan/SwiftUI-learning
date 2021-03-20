//
//  IPadSidebarView.swift
//  iOS
//
//  Created by 杨帆 on 2021/3/20.
//

import SwiftUI

struct IPadSidebarView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("")) {
                    Label(NavMenu.Main, systemImage: NavMenu.MainIcon)
                }

                NavigationLink(destination: Text("")) {
                    Label(NavMenu.Teacher, systemImage: NavMenu.TeacherIcon)
                }

                NavigationLink(destination: Text("")) {
                    Label(NavMenu.Major, systemImage: NavMenu.MajorIcon)
                }

                NavigationLink(destination: Text("")) {
                    Label(NavMenu.Lab, systemImage: NavMenu.LabIcon)
                }

                NavigationLink(destination: Text("")) {
                    Label(NavMenu.Science, systemImage: NavMenu.ScienceIcon)
                }

                NavigationLink(destination: Text("")) {
                    Label(NavMenu.More, systemImage: NavMenu.MoreIcon)
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("学院导航")

            // iPad 首页可以多显示一项内容
            Text("学院介绍 iPadOS")
                .navigationTitle(NavMenu.Intro)
        }
    }
}

struct IPadSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        IPadSidebarView()
    }
}
