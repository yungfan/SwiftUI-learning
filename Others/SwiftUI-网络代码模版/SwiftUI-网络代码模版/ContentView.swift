//
//  ContentView.swift
//  SwiftUI-网络代码模版
//
//  Created by 杨帆 on 2020/3/30.
//  Copyright © 2020 杨帆. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

// Model层
// 创建JSON对应的模型，注意实现的协议
struct Book: Codable, Hashable, Identifiable {
    let id = UUID()
    var name: String
    var title: String
}

// 网络请求成功
struct Success {
    var status: Failure = .Never
    var books: [Book]
}

// 网络请求失败
enum Failure: Error {
    case URLInvalid
    case DataEmpty
    case DataInvalid
    case Never
}

// Network层
// 一个类专门用于负责API网络请求
class API {
    // 每一个网络请求创建一个方法，参数为接收到的数据的逃逸闭包，这里数据为Result
    func getBooks(completion: @escaping (Result<Success, Failure> ) -> ()) {
        
        guard let url = URL(string: "https://www.baidu.com") else {
            completion(.failure(.URLInvalid))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                completion(.failure(.DataEmpty))
                return
            }
            // 转Model，注意这里转模型的时候传入的类型，这里传的是[Book]
            do {
                let books = try JSONDecoder().decode([Book].self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(Success(books: books)))
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(.DataInvalid))
                }
            }
        }
        .resume()
    }
}

// Data层
// 利用Combine完成数据的绑定
class DataStore: ObservableObject {
    
    @Published var success: Success = Success(books: [])
    
    init() {
        fetchBooks()
    }
    
    func fetchBooks() {
        API().getBooks { (result) in
            // 处理Result
            switch result {
            case .failure(let error):
                switch error {
                case .URLInvalid:
                    print("URLInvalid")
                    self.success.status = .URLInvalid
                case .DataEmpty:
                    print("DataEmpty")
                    self.success.status = .DataEmpty
                case .DataInvalid:
                    print("DataInvalid")
                    self.success.status = .DataInvalid
                default:
                    print("Others")
                }
                
            case .success(let content):
                self.success = content
            }
        }
    }
}

// View层
struct ContentView: View {
    
    @ObservedObject var store = DataStore()
    
    var body: some View {
        NavigationView {
            
            // 没有数据时显示正在加载
            if store.success.books.count == 0 {
                
                if store.success.status == Failure.Never {
                    Text("数据加载中")
                        .font(.title)
                        .foregroundColor(.orange)
                }
                    
                else {
                    Text("数据加载失败")
                        .font(.title)
                        .foregroundColor(.orange)
                }
            }
            else{
                List(store.success.books) { book in
                    Text(book.name)
                }.navigationBarTitle("数据展示")
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
