//
//  ContentView.swift
//  CoreML-Image Classified
//
//  Created by 杨帆 on 2022/9/22.
//

import SwiftUI
import UIKit
import VisionKit

struct DataScannerView: UIViewControllerRepresentable {
    @Binding var scanText: String
    @Binding var startScanning: Bool
    
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let controller = DataScannerViewController(recognizedDataTypes: [.text(), .barcode()], qualityLevel: .balanced, isHighlightingEnabled: true)
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if startScanning {
            try? uiViewController.startScanning()
        }
        else {
            uiViewController.stopScanning()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: DataScannerViewControllerDelegate {
    var dataScannerView: DataScannerView
    
    init(_ dataScanner: DataScannerView) {
        self.dataScannerView = dataScanner
    }
    
    func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
        switch item {
        case .text(let text):
            dataScannerView.scanText = text.transcript
        case .barcode(let barcode):
            dataScannerView.scanText = barcode.payloadStringValue ?? ""
        default:
            break
        }
    }
}


struct ContentView: View {
    @State private var scanText = ""
    @State private var startScanning = false
    var body: some View {
        VStack {
            DataScannerView(scanText: $scanText, startScanning: $startScanning)
                .frame(height: 500)
            
            Text(scanText)
                .frame(maxWidth: UIScreen.main.bounds.width, minHeight: 400)
        }
        .task {
            if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                startScanning.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
