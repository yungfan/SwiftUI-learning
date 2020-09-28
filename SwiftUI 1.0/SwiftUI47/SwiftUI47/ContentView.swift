//
//  ContentView.swift
//  SwiftUI47
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct NavVC: UIViewControllerRepresentable {
    
    var vc: UIViewController
    var title: String
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavVC>) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: vc)
        
        return nav
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: UIViewControllerRepresentableContext<NavVC>) {
        
        uiViewController.children[0].title = title
        
    }
    
}

struct ContentView: View {
    var body: some View {
        
        NavVC(vc: UIViewController(), title: "导航控制器")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
