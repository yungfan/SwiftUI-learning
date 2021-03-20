//
//  Constant.swift
//  Shared
//
//  Created by 杨帆 on 2021/3/20.
//

import SwiftUI

// iPadOS导航菜单
struct NavMenu {
    static let Main = "学院首页"
    static let Science = "教学科研"
    static let Intro = "学院介绍"
    static let Lab = "实验设施"
    static let Contact = "联系我们"
    static let Major = "专业介绍"
    static let Teacher = "师资队伍"
    static let More = "查看更多"

    static let MainIcon = "house"
    static let ScienceIcon = "square.grid.2x2"
    static let IntroIcon = "graduationcap"
    static let LabIcon = "display"
    static let ContactIcon = "teletype"
    static let MajorIcon = "book"
    static let TeacherIcon = "rectangle.stack.person.crop"
    static let MoreIcon = "tablecells.badge.ellipsis"
}

// iPhone标签栏
struct TabMenu {
    static let Main = "首页"
    static let Intro = "介绍"
    static let Lab = "设施"
    static let Contact = "联系"
    static let Major = "专业"
    static let Teacher = "师资"
    static let More = "更多"
}


let titles = [NavMenu.Main, NavMenu.Teacher, NavMenu.Major, NavMenu.Lab, NavMenu.Science, NavMenu.More]

let images = [NavMenu.MainIcon, NavMenu.TeacherIcon, NavMenu.MajorIcon, NavMenu.LabIcon, NavMenu.ScienceIcon, NavMenu.MoreIcon]
