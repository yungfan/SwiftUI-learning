//
//  DataPublisher.swift
//  SwiftUI48-News
//
//  Created by 杨帆 on 2019/10/23.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit
import Combine

// 定义ObservableObject
class DataPublisher: ObservableObject {
    
    @Published var news: [DataItem] = []
    
    init() {
        
        let url = URL(string: "http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd")
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        
        // iOS14 以后可以直接绑定到Model
        session.dataTaskPublisher(for: request)
            .map{$0.data}
            .decode(type: NewsModel.self, decoder: JSONDecoder())
            .map { model -> [DataItem] in
                return  model.result.data
            }.receive(on: DispatchQueue.main)
            .catch { error in return Just([])}
            .assign(to: $news)
    }
}
