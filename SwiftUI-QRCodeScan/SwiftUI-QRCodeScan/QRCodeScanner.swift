//
//  QRCodeScan.swift
//  SwiftUI-QRCodeScan
//
//  Created by 杨帆 on 2021/6/22.
//

import AVFoundation
import SwiftUI
import UIKit

/// UIViewController
class ScannerViewController: UIViewController {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var delegate: ScannerCoordinator?
    var metadataOutput: AVCaptureMetadataOutput!
    let videoCaptureDevice = AVCaptureDevice.default(for: .video)
    let scanArea = CGRect(x: (UIScreen.main.bounds.size.width - 300) * 0.5, y: (UIScreen.main.bounds.size.height - 300) * 0.5, width: 300, height: 300)
    var scanView: UIView!
    let maskLayer = CALayer()

    override public func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black

        captureSession = AVCaptureSession()

        guard let videoCaptureDevice = videoCaptureDevice else {
            return
        }

        guard let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice) else { return }

        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            delegate?.didFail(reason: .badInput)
            return
        }

        metadataOutput = AVCaptureMetadataOutput()

        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(delegate, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = delegate?.scanView.codeTypes
        } else {
            delegate?.didFail(reason: .badOutput)
            return
        }
    }

    override public func viewWillLayoutSubviews() {
        previewLayer?.frame = view.layer.bounds
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if previewLayer == nil {
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        }
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)

        scanView = UIView(frame: scanArea)

        // 通知中设置有效区域才有效果
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVCaptureInputPortFormatDescriptionDidChange, object: nil, queue: OperationQueue.main) { _ in
            // 有效区域rectOfInterest的取值范围0～1
            self.metadataOutput.rectOfInterest = self.previewLayer.metadataOutputRectConverted(fromLayerRect: self.scanArea)
        }
        maskLayer.frame = view.bounds
        maskLayer.delegate = self
        view.layer.insertSublayer(maskLayer, above: previewLayer)
        maskLayer.setNeedsDisplay()

        if captureSession?.isRunning == false {
            captureSession.startRunning()
        }
    }

    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        if captureSession?.isRunning == true {
            captureSession.stopRunning()
        }
    }

    override public var prefersStatusBarHidden: Bool {
        return true
    }
}

extension ScannerViewController: CALayerDelegate {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        if layer == maskLayer {
            UIGraphicsBeginImageContextWithOptions(maskLayer.frame.size, false, 1.0)
            // 蒙版颜色
            ctx.setFillColor(UIColor.black.withAlphaComponent(0.5).cgColor)
            ctx.fill(maskLayer.frame)
            // 转换坐标
            let scanFrame = view.convert(scanView.frame, from: scanView.superview)
            // 空出中间scanView的大小
            ctx.clear(scanFrame)
        }
    }
}

enum ScanError: Error {
    case badInput, badOutput
}

/// AVCaptureMetadataOutputObjectsDelegate
class ScannerCoordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
    var scanView: CodeScannerView
    var isFinishScanning = false

    init(scanView: CodeScannerView) {
        self.scanView = scanView
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            guard isFinishScanning == false else { return }

            found(code: stringValue)
            isFinishScanning = true
        }
    }

    func found(code: String) {
        scanView.completion(.success(code))
    }

    func didFail(reason: ScanError) {
        scanView.completion(.failure(reason))
    }
}

/// UIViewControllerRepresentable
struct CodeScannerView: UIViewControllerRepresentable {
    let codeTypes: [AVMetadataObject.ObjectType]
    var completion: (Result<String, ScanError>) -> Void

    init(codeTypes: [AVMetadataObject.ObjectType], completion: @escaping (Result<String, ScanError>) -> Void) {
        self.codeTypes = codeTypes
        self.completion = completion
    }

    func makeCoordinator() -> ScannerCoordinator {
        return ScannerCoordinator(scanView: self)
    }

    func makeUIViewController(context: Context) -> ScannerViewController {
        let viewController = ScannerViewController()
        viewController.delegate = context.coordinator
        return viewController
    }

    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {
    }
}
