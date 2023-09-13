//
//  ContentView.swift
//  Swift Charts
//
//  Created by 杨帆 on 2023/9/13.
//

import Charts
import SwiftUI

// MARK: - 数据模型
struct Amount: Identifiable {
    var id = UUID()
    var quarter: String
    var amount: Int
}

// MARK: - 模拟数据
extension Amount {
    static var exampleData: [Amount] = [
        .init(quarter: "一季度", amount: 100),
        .init(quarter: "二季度", amount: 140),
        .init(quarter: "三季度", amount: 160),
        .init(quarter: "四季度", amount: 200)]
}

struct ContentView: View {
    @State private var amountData = Amount.exampleData

    var body: some View {
        VStack {
            Chart {
                ForEach(amountData) { data in
                    SectorMark(angle: .value("销量", data.amount),
                               innerRadius: .ratio(0.45), // 中间空心圆的半径
                               outerRadius: data.quarter == "一季度" ? .ratio(1.0) : .ratio(0.8), // 外围实心圆的半径
                               angularInset: 1.5 // 饼状之间的间距
                    )
                    .cornerRadius(5, style: .continuous) // 饼状圆角
                    .foregroundStyle(by: .value("季度", data.quarter))
                    .annotation(position: .overlay) {
                        Text("\(data.amount)")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            }
            .padding(20)

            Chart {
                ForEach(amountData) { data in
                    SectorMark(angle: .value("销量", data.amount),
                               innerRadius: .ratio(0)
                    )
                    .foregroundStyle(by: .value("季度", data.quarter))
                }
            }
            .padding(20)

            Chart {
                ForEach(amountData) { data in
                    SectorMark(angle: .value("销量", data.amount),
                               innerRadius: .ratio(0.9),
                               angularInset: 0.5
                    )
                    .cornerRadius(1, style: .continuous)
                    .foregroundStyle(by: .value("季度", data.quarter))
                }
            }
            .padding(20)
        }
    }
}


#Preview {
    ContentView()
}
