//
//  ContentView.swift
//  Swift Charts
//
//  Created by 杨帆 on 2022/9/20.
//

import Charts
import SwiftUI

struct Amount: Identifiable {
    var id = UUID()
    var quarter: String
    var amount: Int
}

struct Amounts: Identifiable {
    var id = UUID()
    var name: String
    var amounts: [Amount]
}

extension Amount {
    static var exampleData: [Amount] = [
        .init(quarter: "一季度", amount: 100),
        .init(quarter: "二季度", amount: 140),
        .init(quarter: "三季度", amount: 150),
        .init(quarter: "四季度", amount: 200)]

    static var exampleData2: [Amount] = [
        .init(quarter: "一季度", amount: 180),
        .init(quarter: "二季度", amount: 160),
        .init(quarter: "三季度", amount: 140),
        .init(quarter: "四季度", amount: 120)]
}

enum AmountType {
    case iPhone, iPad
}

extension Amounts {
    static var exampleData: [Amounts] = [
        .init(name: "iPhone", amounts: [.init(quarter: "一季度", amount: 100),
                                        .init(quarter: "二季度", amount: 160),
                                        .init(quarter: "三季度", amount: 170),
                                        .init(quarter: "四季度", amount: 240)]),
        .init(name: "iPad", amounts: [.init(quarter: "一季度", amount: 120),
                                      .init(quarter: "二季度", amount: 140),
                                      .init(quarter: "三季度", amount: 180),
                                      .init(quarter: "四季度", amount: 200)]),
        .init(name: "iMac", amounts: [.init(quarter: "一季度", amount: 140),
                                      .init(quarter: "二季度", amount: 160),
                                      .init(quarter: "三季度", amount: 190),
                                      .init(quarter: "四季度", amount: 220)]),
        .init(name: "iWatch", amounts: [.init(quarter: "一季度", amount: 80),
                                        .init(quarter: "二季度", amount: 100),
                                        .init(quarter: "三季度", amount: 120),
                                        .init(quarter: "四季度", amount: 160)])]
}

// struct ContentView: View {
//    var amountData = Amount.exampleData
//
//    var body: some View {
//        Chart {
//            ForEach(amountData) { data in
//                PointMark(x: .value("季度", data.quarter),
//                          y: .value("销量", data.amount))
//                .symbol(by: .value("季度", data.quarter))
//                .foregroundStyle(by: .value("季度", data.quarter))
//                .annotation {
//                    Text("\(data.amount)")
//                        .font(.system(size: 10))
//                }
//            }
//        }
//        .chartYAxis {
//            AxisMarks(position: .leading)
//        }
//        .chartYScale(domain: 0 ... 500)
//        .chartXAxis {
//            AxisMarks(position: .top)
//        }
//        .chartXAxisLabel("季度", position: .bottomTrailing)
//        .chartYAxisLabel("销量", position: .topLeading)
//        .chartLegend(position: .top, alignment: .center, spacing: 10)
// //       .chartLegend(.hidden)
////        .chartXAxis(.hidden)
////        .chartYAxis(.hidden)
//        .chartBackground { _ in
//            Color.red
//        }
//        .chartPlotStyle { plot in
//            plot.frame(height: 60*6)
//                .background(.green.opacity(0.5))
//                .border(.black, width: 1)
//        }
//        .frame(width: 360, height: 360)
//    }
// }

// struct ContentView: View {
//    var amountData = Amount.exampleData
//
//    var body: some View {
//        Chart {
//            ForEach(amountData) { data in
//                LineMark(x: .value("季度", data.quarter), y: .value("销量", data.amount))
//                    .foregroundStyle(.red)
//                    .symbol(by: .value("季度", data.quarter))
//                    .interpolationMethod(.monotone)
//            }
//        }
//        .chartLegend(position: .top, alignment: .center) {
//            HStack(spacing: 20) {
//                VStack(spacing: 3) {
//                    Text("1")
//
//                    Color.red.frame(width: 20, height: 5)
//                }
//
//                VStack(spacing: 3) {
//                    Text("2")
//
//                    Color.green.frame(width: 20, height: 5)
//                }
//
//                VStack(spacing: 3) {
//                    Text("3")
//
//                    Color.blue.frame(width: 20, height: 5)
//                }
//
//                VStack(spacing: 3) {
//                    Text("4")
//
//                    Color.purple.frame(width: 20, height: 5)
//                }
//            }
//        }
//        .frame(width: 360, height: 360)
//    }
// }

// struct ContentView: View {
//    var amountData = Amounts.exampleData
//
//    var body: some View {
//        Chart(amountData) { datas in
//            ForEach(datas.amounts) { data in
//                LineMark(x: .value("季度", data.quarter),
//                         y: .value("销量", data.amount),
//                         series: .value("型号", datas.name)
//                )
//                .foregroundStyle(by: .value("季度", datas.name))
//                .symbol(by: .value("商品", datas.name))
//            }
//        }
//        .frame(width: 360, height: 360)
//    }
// }

// struct ContentView: View {
//    var amountData = Amount.exampleData
//
//    var body: some View {
//        Chart {
//            ForEach(amountData) { data in
//                BarMark(x: .value("季度", data.quarter),
//                         y: .value("销量", data.amount)
//                )
//                .foregroundStyle(by: .value("季度", data.quarter))
//                //.position(by: .value("销量", data.amount))
//            }
//        }
//        .chartForegroundStyleScale([
//            "一季度": .black,
//            "二季度": .teal,
//            "三季度": .red,
//            "四季度": .purple])
//        .frame(width: 360, height: 360)
//    }
// }

// struct ContentView: View {
//    var amountData = Amounts.exampleData
//
//    var body: some View {
//        Chart(amountData) { datas in
//            ForEach(datas.amounts) { data in
//                BarMark(x: .value("季度", data.quarter),
//                         y: .value("销量", data.amount),
//                        stacking: .standard
//                )
//                .foregroundStyle(by: .value("季度", datas.name))
//                .symbol(by: .value("商品", datas.name))
//            }
//        }
//        .frame(width: 360, height: 360)
//    }
// }

// struct ContentView: View {
//    @State private var type: AmountType = .iPhone
//
//    var amountData: [Amount] {
//        if type == .iPhone {
//            return Amount.exampleData
//        } else {
//            return Amount.exampleData2
//        }
//    }
//
//    var body: some View {
//        VStack {
//            Picker("类型", selection: $type.animation(.easeInOut)) {
//                Text("iPhone")
//                    .tag(AmountType.iPhone)
//
//                Text("iPad")
//                    .tag(AmountType.iPad)
//            }
//            .pickerStyle(.segmented)
//
//            Chart {
//                ForEach(amountData) { data in
//                    BarMark(x: .value("季度", data.quarter),
//                            y: .value("销量", data.amount)
//                    )
//                    .foregroundStyle(by: .value("季度", data.quarter))
//                }
//            }
//            .frame(width: 360, height: 360)
//        }
//    }
// }



//struct ContentView: View {
//    var amountData = Amount.exampleData
//
//    var body: some View {
//        Chart {
//            ForEach(amountData) { data in
//
//                LineMark(x: .value("季度", data.quarter),
//                         y: .value("销量", data.amount)
//                )
//                .foregroundStyle(.red)
//                .lineStyle(StrokeStyle(lineWidth: 3.0))
//                //.symbol(by: .value("季度", data.quarter))
//
//                BarMark(x: .value("季度", data.quarter),
//                        y: .value("销量", data.amount)
//                )
//                .foregroundStyle(by: .value("季度", data.quarter))
//            }
//        }
//        .frame(width: 360, height: 360)
//    }
//}



struct Weather: Identifiable {
    let id = UUID()
    let month: String
    let maxTemp: Double
    let minTemp: Double
    var average: Double {
        (maxTemp + minTemp) / 2
    }
}

// MARK: - 模拟数据
extension Weather {
    static var exampleData: [Weather] = [
        .init(month: "Jan", maxTemp: 10, minTemp: 1),
        .init(month: "Feb", maxTemp: 15, minTemp: 5),
        .init(month: "Mar", maxTemp: 18, minTemp: 8),
        .init(month: "Apr", maxTemp: 23, minTemp: 12),
        .init(month: "May", maxTemp: 27, minTemp: 17),
        .init(month: "Jun", maxTemp: 30, minTemp: 23),
        .init(month: "Jul", maxTemp: 35, minTemp: 26),
        .init(month: "Aug", maxTemp: 37, minTemp: 29),
        .init(month: "Sep", maxTemp: 33, minTemp: 26),
        .init(month: "Oct", maxTemp: 29, minTemp: 20),
        .init(month: "Nov", maxTemp: 20, minTemp: 10),
        .init(month: "Dec", maxTemp: 6, minTemp: 1)]
}

//struct ContentView: View {
//    var weatherData = Weather.exampleData
//
//    var body: some View {
//        Chart(weatherData) { weather in
//            AreaMark(x: .value("月份", weather.month), yStart: .value("最低温度", weather.minTemp), yEnd: .value("最高温度", weather.maxTemp))
//                .foregroundStyle(.green.opacity(0.5))
//
//            PointMark(x: .value("月份", weather.month),
//                      y: .value("平均温度", weather.average))
//            .annotation {
//                Text("\(weather.average.formatted())")
//            }
//            .foregroundStyle(.red)
//        }
//    }
//}



//struct ContentView: View {
//    var weatherData = Weather.exampleData
//
//    var body: some View {
//        Chart(weatherData) { weather in
//            RuleMark(x: .value("月份", weather.month), yStart: .value("最低温度", weather.minTemp), yEnd: .value("最高温度", weather.maxTemp))
//                .foregroundStyle(.green.opacity(0.5))
//        }
//    }
//}



//struct ContentView: View {
//    var weatherData = Weather.exampleData
//
//    var body: some View {
//        Chart(weatherData) { weather in
//            RectangleMark(x: .value("月份", weather.month), yStart: .value("最低温度", weather.minTemp), yEnd: .value("最高温度", weather.maxTemp))
//                .foregroundStyle(.green.opacity(0.5))
//        }
//    }
//}



struct ContentView: View {
    @State private var amountData = Amount.exampleData

    var body: some View {
        NavigationStack {
            ScrollView {
                Chart {
                    ForEach(amountData) { data in
                        BarMark(
                            x: .value("季度", data.quarter),
                            y: .value("销量", data.amount)
                        )
                        .foregroundStyle(by: .value("季度", data.quarter))
                        .position(by: .value("销量", data.amount)) // 粗细
                    }
                }
                .chartForegroundStyleScale([ // 自定义foregroundStyle的颜色
                    "一季度": .orange,
                    "二季度": .red,
                    "三季度": .green,
                    "四季度": .blue])
                .padding(20)
                .frame(height: 360)
            }
            .navigationTitle("柱状图")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
