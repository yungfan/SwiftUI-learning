//
//  DetailsView.swift
//  SwiftUI48-News
//
//  Created by 杨帆 on 2019/10/23.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI
import WebKit


struct DetailWebView: UIViewRepresentable {
    
    var urlString: String
    
    func makeUIView(context: UIViewRepresentableContext<DetailWebView>) -> WKWebView {
        
        let webView = WKWebView()
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<DetailWebView>) {
        
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        
        uiView.load(request)
        
    }
    
}

struct DetailsView: View {
    
    var urlString: String = ""
    
    var body: some View {
        
        DetailWebView(urlString: urlString)
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
