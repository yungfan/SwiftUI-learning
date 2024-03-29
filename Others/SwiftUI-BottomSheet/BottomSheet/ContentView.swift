//
//  ContentView.swift
//  BottomSheet
//
//  Created by 杨帆 on 2021/8/11.
//

import SwiftUI

struct ContentView: View {
    @State private var sheetMode: SheetMode = .none

    @State private var deltaPositon = CGSize.zero

    @State private var finalPosition = CGSize.zero

    var body: some View {
        ZStack {
            Button("显示") {
                sheetMode = .quarter
            }

            BottonSheet(sheetMode: $sheetMode) {
                Color.green
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous))
                    .overlay( // 指示器
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .fill(Color.gray)
                            .offset(y: 8)
                            .frame(width: 40, height: 4), alignment: .top)
                    .gesture(
                        DragGesture()
                            .onChanged { postion in
                                self.deltaPositon = postion.translation
                            }
                            .onEnded { _ in
                                // 向下
                                if self.deltaPositon.height > 0 {
                                    switch sheetMode {
                                    case .none:
                                        print("")
                                    case .quarter:
                                        sheetMode = .none
                                    case .half:
                                        sheetMode = .quarter
                                    case .threeQuarter:
                                        sheetMode = .half
                                    case .full:
                                        sheetMode = .threeQuarter
                                    }
                                } else {
                                    // 向上
                                    switch sheetMode {
                                    case .none:
                                        sheetMode = .quarter
                                    case .quarter:
                                        sheetMode = .half
                                    case .half:
                                        sheetMode = .threeQuarter
                                    case .threeQuarter:
                                        sheetMode = .full
                                    case .full:
                                        print("")
                                    }
                                }

                                self.deltaPositon = CGSize.zero
                            }
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
