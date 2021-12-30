//
//  CloudService.swift
//  iCloud-Documents
//
//  Created by 杨帆 on 2021/12/29.
//

import Foundation

enum CloudError: Error {
    case cloudDisabled
    case couldNotAccessCloud
    case cloudFileDoesNotExist
    case couldNotReadContent
    case unknown(Error)
}

class CloudService {
    // 外面传进来的闭包
    var cloudContentDidUpdate: (() -> Void)?

    // 下载数据以后就会调用闭包
    private(set) var cloudContent = "" {
        didSet { cloudContentDidUpdate?() }
    }

    // 文件路径
    // 返回与提供的容器ID相对应的ubiquity容器根目录/Documents/cloudFile.txt
    private var cloudUrl = FileManager.default.url(forUbiquityContainerIdentifier: nil)?.appendingPathComponent("Documents").appendingPathComponent("cloudFile.txt") // 文件名

    // 观察者
    private var cloudObserver: NSObjectProtocol?
    // 元数据查询
    private let iCloudQuery = NSMetadataQuery()

    init() {
        print(cloudUrl ?? "")
        downloadFile()
        observeCloudFile()
    }

    private func observeCloudFile() {
        // 添加观察者
        if let cloudObserver = cloudObserver {
            NotificationCenter.default.removeObserver(cloudObserver)
        }
        // 需要更新时下载文件
        cloudObserver = NotificationCenter.default.addObserver(forName: .NSMetadataQueryDidUpdate, object: nil, queue: nil) { [weak self] _ in
            self?.downloadFile()
        }

        // 设置搜索文档
        // 搜索范围
        iCloudQuery.searchScopes = [NSMetadataQueryUbiquitousDocumentsScope]
        // 过滤条件
        iCloudQuery.predicate = NSPredicate(format: "(%K = %@ AND %K = %@)", NSMetadataItemFSNameKey, "cloudFile.txt", NSMetadataUbiquitousItemDownloadingStatusKey, NSMetadataUbiquitousItemDownloadingStatusCurrent
        )

        iCloudQuery.enableUpdates()
        // 开始查询
        iCloudQuery.start()

        if let cloudUrl = cloudUrl {
            // 将文件从iCloud下载到本地
            try? FileManager.default.startDownloadingUbiquitousItem(at: cloudUrl)
        }
    }

    deinit {
        // 移除观察者
        if let cloudObserver = cloudObserver {
            NotificationCenter.default.removeObserver(cloudObserver)
        }
        // 停止查询
        iCloudQuery.stop()
    }
}

extension CloudService {
    // 检查ubiquity容器是否可用
    // 要获取令牌，需要打开iCloud Drive，如果关闭，ubiquityIdentityToken将返回nil
    var isCloudEnabled: Bool { FileManager.default.ubiquityIdentityToken != nil }

    // 上传数据
    @discardableResult
    func uploadFile(content: String) -> Result<Void, CloudError> {
        guard isCloudEnabled else { return .failure(.cloudDisabled) }
        guard let cloudUrl = cloudUrl else { return .failure(.couldNotAccessCloud) }
        do {
            guard let data = content.data(using: .utf8) else { return .failure(.couldNotReadContent) }
            // 数据写入URL
            try data.write(to: cloudUrl)
            return .success(())
        } catch {
            return .failure(.unknown(error))
        }
    }

    // 下载数据
    @discardableResult
    func downloadFile() -> Result<String, CloudError> {
        // iCould是否能用
        guard isCloudEnabled else { return .failure(.cloudDisabled) }
        // URL是否正确
        guard let cloudUrl = cloudUrl else { return .failure(.couldNotAccessCloud) }
        // 文件是否存在
        guard FileManager.default.fileExists(atPath: cloudUrl.path) else { return .failure(.cloudFileDoesNotExist) }

        do {
            // 从URL获取数据
            cloudContent = try String(contentsOf: cloudUrl)
            return .success(cloudContent)
        } catch {
            return .failure(.unknown(error))
        }
    }
}
