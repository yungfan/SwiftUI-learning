//
//  DataPublisher.swift
//  SwiftUI48-News
//
//  Created by 杨帆 on 2019/10/23.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit
import Combine

class DataPublisher: ObservableObject {
    
    
    let dataPublisher: AnyPublisher<URLSession.DataTaskPublisher.Output, URLSession.DataTaskPublisher.Failure>
    
    @Published var news:[DataItem] = []
    
    
    init() {
        
        let url = URL(string: "http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd")
        
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        
        self.dataPublisher = session.dataTaskPublisher(for: request).eraseToAnyPublisher()
        
        _ = self.dataPublisher.receive(on: DispatchQueue.main).sink(receiveCompletion: {_ in
            
        }) { (data: Data, response: URLResponse) in
            
            self.news = try! JSONDecoder().decode(NewsModel.self, from: data).result.data
            
        }
        
    }

}
