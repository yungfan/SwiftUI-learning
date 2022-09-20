//
//  ContentView.swift
//  SwiftUI-WeatherKit
//
//  Created by 杨帆 on 2022/6/17.
//

import CoreLocation
import SwiftUI
import WeatherKit

struct ContentView: View {
    // 位置信息
    let location = CLLocation(latitude: 31.35, longitude: 118.37)
    // 天气信息
    @State private var weather: Weather?

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.teal.gradient)
                .ignoresSafeArea(.all)

            VStack(spacing: 10) {
                // 获取当前天气
                if let weather = weather?.currentWeather {
                    Text(weather.date.formatted(.dateTime.year().month().day().hour().minute()
                            .locale(Locale(identifier: "zh_Hans_CN"))))
                        .font(.system(size: 30))
                        .padding(.top)

                    Image(systemName: weather.symbolName)
                        .font(.system(size: 200.0, weight: .ultraLight))
                        .foregroundColor(.purple)

                    Text("芜湖   \(String(format: "%.1f", weather.temperature.converted(to: .celsius).value)) ℃")
                        .font(.system(size: 48))
                        .padding(.bottom)
                        .foregroundStyle(.orange)

                    VStack(alignment: .leading, spacing: 10) {
                        Text("当前天气：\(weather.condition.rawValue)")

                        Text("体感温度：\(String(format: "%.1f", weather.apparentTemperature.converted(to: .celsius).value)) ℃")

                        Text("当前风向：\(weather.wind.compassDirection.rawValue)")

                        Text("当前风速：\(String(format: "%.1f", weather.wind.speed.value)) km/h")

                        Text("当前湿度：\(weather.humidity.formatted(.percent))")
                    }
                    .font(.title2)
                    .foregroundStyle(.white)

                    Spacer()
                } else {
                    ProgressView()
                }
            }
            .padding()
        }
        .task {
            await getWeather(location: location)
        }
    }

    // MARK: 获取天气
    func getWeather(location: CLLocation) async {
        // 1. 获取天气服务
        let service = WeatherService.shared
        // 2. 获取天气数据
        Task.detached {
            weather = try? await service.weather(for: location)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
