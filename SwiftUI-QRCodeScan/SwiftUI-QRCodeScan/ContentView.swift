//
//  ContentView.swift
//  SwiftUI-QRCodeScan
//
//  Created by 杨帆 on 2021/6/22.
//

import SwiftUI

struct ContentView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("扫描结果：\(scannedCode)")

                Button("扫描二维码") {
                    self.isPresentingScanner = true
                }
                .sheet(isPresented: $isPresentingScanner) {
                    self.scannerSheet
                }
            }
        }
    }

    var scannerSheet: some View {
        CodeScannerView(codeTypes: [.qr], completion: { result in
            switch result {
            case let .success(code):
                self.scannedCode = code
                self.isPresentingScanner = false
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
