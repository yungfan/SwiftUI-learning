//
//  DataPublisher.swift
//  SwiftUI48-News
//
//  Created by 杨帆 on 2019/10/23.
//  Copyright © 2019 杨帆. All rights reserved.
//

import Combine
import UIKit

// 定义ObservableObject
class DataPublisher: ObservableObject {
    // 第一种方式的发布者
    // private var dataPublisher: AnyPublisher<URLSession.DataTaskPublisher.Output, URLSession.DataTaskPublisher.Failure>

    // 真正需要的数据
    @Published var news: [DataItem] = []

    // 持有订阅者
    var cancellable: AnyCancellable?

    init() {
        let url = URL(string: "http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd")
        let request = URLRequest(url: url!)
        let session = URLSession.shared

        /**
          // 第一种方式
          // 1. 创建发布者
          self.dataPublisher = session.dataTaskPublisher(for: request).eraseToAnyPublisher()

          // 2. 订阅
          // 非常通用的 `Subscriber` ，我们可以自由的处理数据流的状态
          // 让订阅者被属性持有而不会释放
         cancellable = dataPublisher
             .receive(on: DispatchQueue.main).sink(receiveCompletion: {_ in
             }) { (data: Data, response: URLResponse) in

                 self.news = try! JSONDecoder().decode(NewsModel.self, from: data).result.data
         }
          */

        // 第二种方式：将上面两步合二为一
        // 也可以一步到位
        cancellable = session.dataTaskPublisher(for: request).map { $0.data }.decode(type: NewsModel.self, decoder: JSONDecoder()).eraseToAnyPublisher().receive(on: DispatchQueue.main).sink(receiveCompletion: { _ in }) { newsModel in

            self.news = newsModel.result.data
        }

        /**

         // 第三种方式：传统网络任务模式
         session.dataTask(with: request) { (data, response, error) in
             if let data = data {
                 if let decodedResponse = try? JSONDecoder().decode(NewsModel.self, from: data) {
                     //回到主线程
                     DispatchQueue.main.async {
                         self.news = decodedResponse.result.data
                     }
                 }
             }
         }.resume()
         */
    }
}
