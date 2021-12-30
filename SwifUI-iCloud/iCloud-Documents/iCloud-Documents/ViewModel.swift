//
//  ViewModel.swift
//  iCloud-Documents
//
//  Created by 杨帆 on 2021/12/29.
//
import SwiftUI

final class ViewModel: ObservableObject {
    @Published var content: String = "" {
        didSet {
            guard shouldUploadOnChange else { return }
            uploadFile()
        }
    }

    private var shouldUploadOnChange = true
    private let cloudService = CloudService()

    init() {
        setContent(cloudService.cloudContent)
        // 初始化时就获取数据
        cloudService.cloudContentDidUpdate = { [weak self] in
            self?.setContent(self?.cloudService.cloudContent ?? "")
        }
    }

    // 上传
    func uploadFile() {
        cloudService.uploadFile(content: content)
    }

    // 赋值，如果内容是从云端同步的未做改变则不需要同步
    private func setContent(_ content: String) {
        shouldUploadOnChange = false

        self.content = content
        shouldUploadOnChange = true
    }
}
