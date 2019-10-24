//
//  DetailsView.swift
//  SwiftUI48-News
//
//  Created by 杨帆 on 2019/10/23.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI
import WebKit


struct webView: UIViewRepresentable {
    
    var urlString: String
    
    func makeUIView(context: UIViewRepresentableContext<webView>) -> WKWebView {
        
        let webView = WKWebView()
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<webView>) {
        
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        
        uiView.load(request)
        
    }
    
}

struct DetailsView: View {
    
    var url: String = ""
    
    var body: some View {
        
        webView(urlString: url)
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
