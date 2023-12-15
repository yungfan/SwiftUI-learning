//
//  APIKey.swift
//  Gemini API
//
//  Created by 杨帆 on 2023/12/15.
//

import Foundation
import GoogleGenerativeAI

struct Model {
    static var textModel = GenerativeModel(name: "gemini-pro", apiKey: APIKey.getKey(), generationConfig: GenerationConfig(
        temperature: 0.9,
        topP: 0.1,
        topK: 16,
        maxOutputTokens: 200,
        stopSequences: ["red"]
    ))

    static var textImageModel = GenerativeModel(name: "gemini-pro-vision", apiKey: APIKey.getKey())
}

struct APIKey {
    static func getKey() -> String {
        if let plistPath = Bundle.main.path(forResource: "GenerativeAI-Info", ofType: "plist") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: plistPath)),
               let plist = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any] {
                if let key = plist["APIKey"] as? String {
                    return key
                }
            } else {
                fatalError("Failed to read plist data.")
            }
        } else {
            fatalError("Plist file not found.")
        }
        return ""
    }
}
