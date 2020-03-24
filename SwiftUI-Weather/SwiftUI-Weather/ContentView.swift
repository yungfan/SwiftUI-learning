//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by 杨帆 on 2020/3/24.
//  Copyright © 2020 杨帆. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

// Model层
// MARK: - Model
struct Weather: Codable, Hashable, Identifiable {
    let id = UUID()
    let reason: String
    let result: Result
    let errorCode: Int

    enum CodingKeys: String, CodingKey {
        case reason, result
        case errorCode = "error_code"
    }
}

// MARK: - Result
struct Result: Codable, Hashable, Identifiable {
    let id = UUID()
    let city: String
    let realtime: Realtime
    let future: [Future]
}

// MARK: - Future
struct Future: Codable, Hashable, Identifiable {
    let id = UUID()
    let date, temperature, weather: String
    let wid: Wid
    let direct: String
}

// MARK: - Wid
struct Wid: Codable, Hashable, Identifiable {
    let id = UUID()
    let day, night: String
}

// MARK: - Realtime
struct Realtime: Codable, Hashable, Identifiable {
    let id = UUID()
    let temperature, humidity, info, wid: String
    let direct, power, aqi: String
}




// Network层
// 一个类专门用于负责API网络请求
class API {
    // 每一个网络请求创建一个方法，参数为接收到的数据的逃逸闭包，这里数据为模型数组
    func getWeather(completion: @escaping ([Future]) -> ()) {
        guard let url = URL(string: "http://apis.juhe.cn/simpleWeather/query?city=%E8%8A%9C%E6%B9%96&key=25ca0b78d78b2dc7761bc2e4af6d82fc")
                  else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            // 转Model
            let weather = try! JSONDecoder().decode(Weather.self, from: data)
            DispatchQueue.main.async {
                completion(weather.result.future)
            }
        }
        .resume()
    }
}

// Data层
// 利用Combine完成数据的绑定
class DataStore: ObservableObject {
    
    @Published var weathers: [Future] = []
    
    init() {
        fetchBooks()
    }
    
    func fetchBooks() {
        API().getWeather { (weathers) in
            self.weathers = weathers
        }
    }
}

// View层
struct ContentView: View {
    
    @ObservedObject var store = DataStore()
    
    var body: some View {
        NavigationView {
            // 没有数据时显示正在加载
            if store.weathers.count == 0 {
                
                Text("数据加载中")
                    .font(.title)
                    .foregroundColor(.orange)
                    .navigationBarTitle("数据展示")
            }
            else{
                List(store.weathers) { weather in
                    // Row可以很复杂
                    Text(weather.weather)
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
