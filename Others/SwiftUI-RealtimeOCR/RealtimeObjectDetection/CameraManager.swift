//
//  CameraManager.swift
//  RealtimeObjectDetection
//
//  Created by 杨帆 on 2025/5/14.
//

import AVFoundation
import SwiftUI

// MARK: - 相机管理器
class CameraManager: NSObject, ObservableObject {
    @Published var session = AVCaptureSession()
    @Published var output = AVCaptureVideoDataOutput()
    @Published var previewLayer: AVCaptureVideoPreviewLayer?
    @Published var currentImage: UIImage?
    @Published var permissionGranted = false

    let cameraQueue = DispatchQueue(label: "CameraQueue")

    override init() {
        super.init()
        checkPermission()
    }

    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            permissionGranted = true
            setupCamera()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                DispatchQueue.main.async {
                    self?.permissionGranted = granted
                    if granted {
                        self?.setupCamera()
                    }
                }
            }
        default:
            permissionGranted = false
        }
    }

    func setupCamera() {
        do {
            session.beginConfiguration()

            // 添加视频输入
            guard let videoDevice = AVCaptureDevice.default(.builtInTripleCamera, for: .video, position: .back) else {
                print("无法获取后置摄像头")
                return
            }

            let videoInput = try AVCaptureDeviceInput(device: videoDevice)
            if session.canAddInput(videoInput) {
                session.addInput(videoInput)
            }

            // 设置视频输出
            if session.canAddOutput(output) {
                session.addOutput(output)
            }

            output.setSampleBufferDelegate(self, queue: cameraQueue)
            output.alwaysDiscardsLateVideoFrames = true

            // 创建预览层
            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            self.previewLayer = previewLayer

            session.commitConfiguration()
        } catch {
            print("设置相机错误: \(error)")
        }
    }

    func startSession() {
        if !session.isRunning {
            DispatchQueue.global(qos: .background).async { [weak self] in
                self?.session.startRunning()
            }
        }
    }

    func stopSession() {
        if session.isRunning {
            DispatchQueue.global(qos: .background).async { [weak self] in
                self?.session.stopRunning()
            }
        }
    }

    func captureImage() -> UIImage? {
        return currentImage
    }
}

// MARK: - 扩展CameraManager实现AVCaptureVideoDataOutputSampleBufferDelegate
extension CameraManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }

        let ciImage = CIImage(cvPixelBuffer: imageBuffer)
        let context = CIContext()
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return }

        let image = UIImage(cgImage: cgImage)
        DispatchQueue.main.async { [weak self] in
            self?.currentImage = image
        }
    }
}

// MARK: - 相机预览视图
struct CameraPreview: UIViewRepresentable {
    @ObservedObject var cameraManager: CameraManager

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .black

        if let previewLayer = cameraManager.previewLayer {
            previewLayer.videoGravity = .resizeAspectFill
            view.layer.addSublayer(previewLayer)
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.layer.sublayers?.forEach { layer in
            if layer is AVCaptureVideoPreviewLayer {
                layer.removeFromSuperlayer()
            }
        }

        if let previewLayer = cameraManager.previewLayer {
            previewLayer.frame = uiView.bounds
            uiView.layer.addSublayer(previewLayer)
        }
    }
}
