import MultipeerConnectivity
import os

class MultipeerSession: NSObject, ObservableObject {
    // 标识符(相当于频段号，不能是纯数字)
    private let serviceType = "test9527"
    // 通信会话
    private let session: MCSession
    // 用户信息
    private let myPeerId = MCPeerID(displayName: UIDevice.current.name)
    // 服务端，发送广播，处理客户端的连接请求
    private let serviceAdvertiser: MCNearbyServiceAdvertiser
    // 客户端，搜索附近的服务端，连接服务器
    private let serviceBrowser: MCNearbyServiceBrowser
    private let log = Logger()

    @Published var currentColor: NamedColor? = nil
    @Published var connectedPeers: [MCPeerID] = []

    override init() {
        // 初始化
        session = MCSession(peer: myPeerId)
        serviceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: nil, serviceType: serviceType)
        serviceBrowser = MCNearbyServiceBrowser(peer: myPeerId, serviceType: serviceType)

        super.init()

        // 设置代理
        session.delegate = self
        serviceAdvertiser.delegate = self
        serviceBrowser.delegate = self

        // 发送广播
        serviceAdvertiser.startAdvertisingPeer()
        // 扫描服务
        serviceBrowser.startBrowsingForPeers()
    }

    deinit {
        // 停止广播
        serviceAdvertiser.stopAdvertisingPeer()
        // 断开服务
        serviceBrowser.stopBrowsingForPeers()
    }

    // 发送消息
    func send(color: NamedColor) {
        currentColor = color

        if !session.connectedPeers.isEmpty {
            do {
                // 发送二进制数据
                try session.send(color.rawValue.data(using: .utf8)!, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                log.error("Error for sending: \(String(describing: error))")
            }
        }
    }
}

// MCNearbyServiceAdvertiserDelegate
extension MultipeerSession: MCNearbyServiceAdvertiserDelegate {
    // 接收到客户端要求连接消息时调用
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        // 一般都是同意连接并加入会话
        invitationHandler(true, session)
    }

    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
    }
}

// MCNearbyServiceBrowserDelegate
extension MultipeerSession: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String: String]?) {
        // 请求连接到对应的服务节点
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 10)
    }

    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
    }

    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
    }
}

// MCSessionDelegate
extension MultipeerSession: MCSessionDelegate {
    // 状态改变时调用
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .notConnected:
            log.info("peer <\(peerID.displayName)> is notConnected")
        case .connecting:
            log.info("peer <\(peerID.displayName)> is connecting")
        case .connected:
            log.info("peer <\(peerID.displayName)> is connected")
            DispatchQueue.main.async {
                self.connectedPeers = session.connectedPeers
            }
        @unknown default:
            fatalError()
        }
    }

    // 接收到二进制数据时调用
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        log.info("receive data fromPeer <\(peerID.displayName)>")
        if let string = String(data: data, encoding: .utf8), let color = NamedColor(rawValue: string) {
            DispatchQueue.main.async {
                self.currentColor = color
            }
        } else {
            log.info("didReceive invalid value \(data.count) bytes")
        }
    }

    public func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
    }

    public func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
    }

    public func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
    }
}
