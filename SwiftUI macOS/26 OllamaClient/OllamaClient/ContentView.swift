//
//  ContentView.swift
//  OllamaClient
//
//  Created by 杨帆 on 2025/3/17.
//

import Ollama
import SwiftUI

struct ContentView: View {
    // 用户输入
    @State private var userInput: String = "什么是SwiftUI？"
    // 输出结果
    @State private var response: String = ""
    @State private var isLoading: Bool = false
    // 默认http://localhost:11434
    let client = Client(host: URL(string: "http://192.168.0.43:11434")!, userAgent: "MyApp/1.0")
    // 多论对话
    @State private var messages: [Chat.Message] = [.system("你是一个得力的全能助手，可以帮我完成很多任务。")]
    var body: some View {
        VStack(spacing: 16) {
            // 顶部输入区域
            HStack {
                TextField("输入提示词...", text: $userInput)
                    .textFieldStyle(.roundedBorder)
                    .font(.system(size: 16))

                Button {
                    response = ""

                    Task {
                        do {
                            // response = try await generate()
                            response = try await chatSingleAround()
                           // response = try await chatMultipleAround()
                        } catch {
                            debugPrint(error)
                        }
                    }
                } label: {
                    Text("开始")
                        .foregroundStyle(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(userInput.isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(8)
                }
                .buttonStyle(.borderless)
                .disabled(userInput.isEmpty || isLoading)
            }
            .padding(.horizontal)
            .padding(.top)

            // 分隔线
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 1)

            // 响应展示区域
            if response != "" {
                ResponseBubble(text: response)
            }

            Spacer()
        }

        if isLoading {
            ProgressView()
                .progressViewStyle(.circular)
                .padding()
        }
    }

    // MARK: 生成
    func generate() async throws -> String {
        isLoading = true
        let response = try await client.generate(
            model: "qwen:0.5b",
            prompt: userInput,
            stream: false
        )
        isLoading = false
        return response.response
    }

    // MARK: 单轮聊天
    func chatSingleAround() async throws -> String {
        isLoading = true
        let response = try await client.chat(
            model: "qwen:0.5b",
            messages: [
                .system("你是一个得力的全能助手，可以帮我完成很多任务。"),
                .user(userInput)
            ]
        )
        isLoading = false
        return response.message.content
    }
    
    // MARK: 多轮聊天
    func chatMultipleAround() async throws -> String {
        var response = ""
        isLoading = true
        // 第一轮
        messages.append(.user("什么是SwiftUI？"))
        response.append("1.什么是SwiftUI？\n")
        let response1 = try await client.chat(
            model: "qwen:0.5b",
            messages: messages
        )
        response.append(response1.message.content)
        // 第二轮
        messages.append(.user("SwiftUI和UIKit有什么区别?"))
        response.append("\n\n2.SwiftUI和UIKit有什么区别?\n")
        let response2 = try await client.chat(
            model: "qwen:0.5b",
            messages: messages
        )
        response.append(response2.message.content)
        isLoading = false
        return response
    }
}

// MARK: - 显示结果
struct ResponseBubble: View {
    let text: String

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text("AI")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)

                Text(text)
                    .font(.system(size: 16))
                    .lineSpacing(4)
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(12)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
