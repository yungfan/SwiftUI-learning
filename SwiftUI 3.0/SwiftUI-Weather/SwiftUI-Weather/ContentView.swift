//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by 杨帆 on 2021/10/14.
//

import SwiftUI

struct Weather: Codable {
    let reason: String
    let result: Result
    let error_code: Int
}

struct Result: Codable {
    let city: String
    let realtime: Realtime
    let future: [Future]
}

struct Future: Codable, Identifiable {
    let id = UUID()
    let date, temperature, weather, direct: String
    let wid: Wid
}

struct Wid: Codable {
    let day, night: String
}

struct Realtime: Codable {
    let temperature, humidity, info, wid, direct, power, aqi: String
}

class Client {
    let session = URLSession.shared
    let jsonDecoder = JSONDecoder()

    public func get<T: Codable>() async throws -> T? {
        guard let urlString = "http://apis.juhe.cn/simpleWeather/query?city=芜湖&key=聚合数据的key".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) else { return nil }

        let (data, _) = try await session.data(for: URLRequest(url: url), delegate: nil)
        do {
            let t = try jsonDecoder.decode(T.self, from: data)
            return t

        } catch {
            print(error.localizedDescription)

            return nil
        }
    }
}

@MainActor
class ViewModel: ObservableObject {
    @Published var future: [Future]? = [Future]()

    func getWeather() async {
        do {
            let weather: Weather? = try await Client().get()

            future = weather?.result.future
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            if let future = viewModel.future {
                List {
                    ForEach(future) { weather in
                        HStack {
                            Text(weather.date)

                            Text(weather.weather)
                                .foregroundStyle(.green)

                            Spacer()

                            Text(weather.temperature)
                                .foregroundStyle(.gray)
                        }
                        .font(.system(size: 18))
                    }
                }
                .task {
                    await viewModel.getWeather()
                }
                .navigationTitle("天气预报")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
