//
//  ContentView.swift
//  watchOS WatchKit Extension
//
//  Created by 杨帆 on 2021/4/13.
//

import SwiftUI

struct WatchContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text(NavMenu.Main)) {
                    Label(NavMenu.Main, systemImage: NavMenu.MainIcon)
                }

                NavigationLink(destination: Text("")) {
                    Label(NavMenu.Teacher, systemImage: NavMenu.TeacherIcon)
                }

                NavigationLink(destination: Text(NavMenu.Major)) {
                    Label(NavMenu.Major, systemImage: NavMenu.MajorIcon)
                }

                NavigationLink(destination: Text(NavMenu.Lab)) {
                    Label(NavMenu.Lab, systemImage: NavMenu.LabIcon)
                }

                NavigationLink(destination: Text(NavMenu.Science)) {
                    Label(NavMenu.Science, systemImage: NavMenu.ScienceIcon)
                }

                NavigationLink(destination: Text(NavMenu.More)) {
                    Label(NavMenu.More, systemImage: NavMenu.MoreIcon)
                }
            }
        }.navigationTitle("学院导航")
    }
}

struct WatchContentView_Previews: PreviewProvider {
    static var previews: some View {
        WatchContentView()
    }
}
