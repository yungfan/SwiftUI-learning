//
//  ContentView.swift
//  Gemini API
//
//  Created by 杨帆 on 2023/12/15.
//

import GoogleGenerativeAI
import SwiftUI
import UIKit

struct ContentView: View {
    @State private var prompt = "Swift是谁发明的？最新版本是多少？"
    @State private var prompt2 = "根据内容创作一首四言绝句。"
    @State private var result = ""
    @State private var result2 = ""

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("text-only")
                    .font(.title)

                TextEditor(text: $prompt)
                    .foregroundStyle(.black)
                    .border(Color.black, width: 2)
                    .frame(height: 60)

                HStack {
                    Button("整个输出") {
                        result = ""
                        Task {
                            let response = try await Model.textModel.generateContent(prompt)
                            if let text = response.text {
                                result = text
                            }
                        }
                    }

                    Button("逐句输出") {
                        result = ""
                        Task {
                            let contentStream = Model.textModel.generateContentStream(prompt)
                            for try await chunk in contentStream {
                                if let text = chunk.text {
                                    result += text
                                }
                            }
                        }
                    }
                }

                Text(result)
                    .foregroundStyle(.red)
            }

            VStack {
                Text("text-and-image")
                    .font(.title)

                Image("test")
                    .resizable()
                    .frame(width: 100, height: 200)

                TextEditor(text: $prompt2)
                    .foregroundStyle(.black)
                    .border(Color.black, width: 2)
                    .frame(height: 60)

                HStack {
                    Button("整个输出") {
                        let image = UIImage(named: "test")!
                        result2 = ""

                        Task {
                            let response = try await Model.textImageModel.generateContent(prompt2, image)
                            if let text = response.text {
                                result2 = text
                            }
                        }
                    }

                    Button("逐句输出") {
                        let image = UIImage(named: "test")!
                        result2 = ""

                        Task {
                            let contentStream = Model.textImageModel.generateContentStream(prompt2, image)
                            for try await chunk in contentStream {
                                if let text = chunk.text {
                                    result2 += text
                                }
                            }
                        }
                    }
                }

                Text(result2)
                    .foregroundStyle(.red)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
