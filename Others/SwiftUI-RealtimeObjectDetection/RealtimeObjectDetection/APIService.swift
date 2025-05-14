//
//  APIService.swift
//  RealtimeObjectDetection
//
//  Created by 杨帆 on 2025/5/14.
//

import SwiftUI

// MARK: - API服务
class APIService: ObservableObject {
    @Published var isProcessing = false
    @Published var responseText = "准备完毕，点击下方的按钮开始"

    func sendImageForAnalysis(baseURL: String, instruction: String, image: UIImage) async {
        guard let imageBase64 = image.jpegData(compressionQuality: 0.8)?.base64EncodedString() else {
            await MainActor.run {
                self.responseText = "图像转换失败"
            }
            return
        }

        let imageBase64URL = "data:image/jpeg;base64,\(imageBase64)"

        // 创建请求体
        let requestBody: [String: Any] = [
            "max_tokens": 100,
            "messages": [
                [
                    "role": "user",
                    "content": [
                        ["type": "text", "text": instruction],
                        ["type": "image_url", "image_url": ["url": imageBase64URL]]
                    ]
                ]
            ]
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            await MainActor.run {
                self.responseText = "JSON序列化失败"
            }
            return
        }

        guard let url = URL(string: "\(baseURL)/v1/chat/completions") else {
            await MainActor.run {
                self.responseText = "无效的URL"
            }
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                await MainActor.run {
                    self.responseText = "无效的响应"
                }
                return
            }

            if httpResponse.statusCode == 200 {
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let choices = json["choices"] as? [[String: Any]],
                   let firstChoice = choices.first,
                   let message = firstChoice["message"] as? [String: Any],
                   let content = message["content"] as? String {
                    await MainActor.run {
                        self.responseText = content
                    }
                } else {
                    await MainActor.run {
                        self.responseText = "解析响应失败"
                    }
                }
            } else {
                let errorText = String(data: data, encoding: .utf8) ?? "未知错误"
                await MainActor.run {
                    self.responseText = "服务器错误: \(httpResponse.statusCode) - \(errorText)"
                }
            }
        } catch {
            await MainActor.run {
                self.responseText = "请求失败: \(error.localizedDescription)"
            }
        }
    }
}
