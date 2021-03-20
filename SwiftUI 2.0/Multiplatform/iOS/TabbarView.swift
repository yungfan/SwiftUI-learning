//
//  TabbarView.swift
//  iOS
//
//  Created by 杨帆 on 2021/3/20.
//

import SwiftUI

enum Tab: String {
    case main
    case clazz
    case lab
    case major
    case more
}

struct TabbarView: View {
    @SceneStorage("selectedTab") var selectedTab = Tab.main

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                Text("")
            }.tabItem {
                Image(systemName: NavMenu.MainIcon)
                Text(TabMenu.Main)
            }.tag(Tab.main)

            NavigationView {
                Text("")
            }.tabItem {
                Image(systemName: NavMenu.IntroIcon)
                Text(TabMenu.Intro)
            }.tag(Tab.clazz)

            NavigationView {
                Text("")
            }.tabItem {
                Image(systemName: NavMenu.MajorIcon)
                Text(TabMenu.Major)
            }.tag(Tab.major)

            NavigationView {
                Text("")
            }.tabItem {
                Image(systemName: NavMenu.LabIcon)
                Text(TabMenu.Lab)
            }.tag(Tab.lab)

            NavigationView {
                Text("")
            }.tabItem {
                Image(systemName: NavMenu.MoreIcon)
                Text(TabMenu.More)
            }.tag(Tab.more)
        }
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
