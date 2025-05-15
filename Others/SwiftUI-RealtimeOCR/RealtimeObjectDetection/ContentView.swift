//
//  ContentView.swift
//  RealtimeObjectDetection
//
//  Created by 杨帆 on 2025/5/14.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var cameraManager = CameraManager()
    @StateObject private var apiService = APIService()
    @State private var baseURL = "http://192.168.0.127:8080"
    @State private var instruction = "请对看的内容中的文本进行准确提取，并只将提取的最终文本告知我."
    @State private var isRunning = false
    @State private var timer: Timer?

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    // 相机预览
                    if cameraManager.permissionGranted {
                        ZStack {
                            CameraPreview(cameraManager: cameraManager)
                                .cornerRadius(12)
                                .frame(maxWidth: .infinity)
                                .aspectRatio(4 / 3, contentMode: .fit)

                            if !cameraManager.permissionGranted {
                                Text("未获得相机权限")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.7))
                                    .cornerRadius(8)
                            }
                        }
                    } else {
                        Text("请允许访问相机权限")
                            .frame(height: 300)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(12)
                    }

                    // 控制区域
                    VStack(spacing: 20) {
                        // 响应显示
                        TextEditor(text: .constant(apiService.responseText))
                            .frame(height: 236)
                            .padding(4)
                            .background(Color(.systemBackground))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(UIColor.separator), lineWidth: 1)
                            )
                            .disabled(true)

                        // 按钮
                        Button(action: toggleProcessing) {
                            Text(isRunning ? "停止" : "开始")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(isRunning ? Color.red : Color.green)
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("实时OCR")
        }
        .navigationViewStyle(.stack)
        .onAppear {
            cameraManager.startSession()
        }
        .onDisappear {
            cameraManager.stopSession()
            stopProcessing()
        }
    }
}

extension ContentView {
    func toggleProcessing() {
        if isRunning {
            stopProcessing()
        } else {
            startProcessing()
        }
    }

    func startProcessing() {
        guard cameraManager.permissionGranted else {
            apiService.responseText = "无法获取摄像头"
            return
        }

        isRunning = true
        apiService.responseText = "正在处理..."

        // 首先立即执行一次
        Task {
            if let image = cameraManager.captureImage() {
                await apiService.sendImageForAnalysis(baseURL: baseURL, instruction: instruction, image: image)
            } else {
                await MainActor.run {
                    apiService.responseText = "无法捕获图像"
                }
            }
        }

        // 然后设置定时器
        timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { _ in
            Task {
                if let image = await cameraManager.captureImage() {
                    await apiService.sendImageForAnalysis(baseURL: baseURL, instruction: instruction, image: image)
                }
            }
        }
    }

    func stopProcessing() {
        isRunning = false
        apiService.responseText = "请点击下方的按钮重新开始"
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    ContentView()
}
