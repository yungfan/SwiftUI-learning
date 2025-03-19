//
//  TouchIndicator.swift
//  TouchIndicator
//  功能：触摸指示器，截图、录屏均可以保存
//  使用：拖入项目即可使用，无需任何其他操作
//
//  Created by 杨帆 on 2025/3/19.
//

import UIKit

/// 触摸指示器类，用于显示触摸反馈
final class TouchIndicator {
    /// 单例实例，确保只有一个触摸指示器
    static let shared = TouchIndicator()

    /// 存储所有活动的触摸视图，使用触摸对象作为Key
    private var touchViews = [UITouch: UIView]()

    /// 创建并显示一个新的触摸指示器视图
    /// - Parameters:
    ///   - touch: 触摸事件对象
    ///   - window: 触摸发生的窗口
    func showTouch(_ touch: UITouch, in window: UIWindow) {
        let location = touch.location(in: window)
        // 创建一个固定大小的触摸指示器视图
        let touchView = UIView(frame: CGRect(x: location.x - 22, y: location.y - 22, width: 44, height: 44))

        // 设置触摸指示器的视觉样式（可以根据需要进行样式的修改）
        touchView.layer.cornerRadius = 22 // 圆形指示器
        touchView.layer.borderColor = UIColor(red: 122 / 255.0, green: 117 / 255.0, blue: 117 / 255.0, alpha: 0.6).cgColor // 边框颜色
        touchView.layer.borderWidth = 1 // 边框宽度
        touchView.backgroundColor = UIColor(red: 171 / 255.0, green: 166 / 255.0, blue: 164 / 255.0, alpha: 0.7) // 填充色
        touchView.isUserInteractionEnabled = false // 禁用触摸交互，防止干扰实际操作

        // 将触摸指示器添加到窗口并保存引用
        window.addSubview(touchView)
        touchViews[touch] = touchView
    }

    /// 更新已存在的触摸指示器的位置
    /// - Parameters:
    ///   - touch: 触摸事件对象
    ///   - window: 触摸发生的窗口
    func updateTouch(_ touch: UITouch, in window: UIWindow) {
        guard let touchView = touchViews[touch] else { return }
        let location = touch.location(in: window)
        touchView.center = location // 更新指示器位置到最新的触摸位置
    }

    /// 移除触摸指示器并播放淡出动画
    /// - Parameter touch: 触摸事件对象
    func hideTouch(_ touch: UITouch) {
        guard let touchView = touchViews[touch] else { return }
        // 添加淡出动画
        UIView.animate(withDuration: 0.2, delay: 0, options: [.beginFromCurrentState], animations: {
            touchView.alpha = 0
        }) { _ in
            touchView.removeFromSuperview() // 动画完成后移除视图
        }
        touchViews[touch] = nil // 移除存储的引用
    }
}

// MARK: - UIWindow Extension
extension UIWindow {
    /// 标记是否已经完成方法交换
    private static var isSwizzled = false

    /// 重写layer属性，用于触发方法交换
    override open var layer: CALayer {
        UIWindow.swizzleImplementations()
        return super.layer
    }

    /// 执行方法交换，替换原始的sendEvent方法
    private class func swizzleImplementations() {
        guard !isSwizzled else { return } // 确保只交换一次
        isSwizzled = true

        // 获取原始方法和新方法
        guard let original = class_getInstanceMethod(self, #selector(UIWindow.sendEvent(_:))) else { return }
        guard let new = class_getInstanceMethod(self, #selector(UIWindow.swizzled_sendEvent(_:))) else { return }
        // 交换方法实现
        method_exchangeImplementations(original, new)
    }

    /// 新的事件处理方法，在原始方法的基础上添加触摸指示器功能
    @objc private func swizzled_sendEvent(_ event: UIEvent) {
        // 调用原始实现（因为方法已经交换，这里实际调用的是原始的sendEvent方法）
        swizzled_sendEvent(event)

        // 处理所有触摸事件
        event.allTouches?.forEach { touch in
            switch touch.phase {
            case .began: // 触摸开始
                TouchIndicator.shared.showTouch(touch, in: self)
            case .moved, .stationary: // 触摸移动或静止
                TouchIndicator.shared.updateTouch(touch, in: self)
            case .cancelled, .ended: // 触摸取消或结束
                TouchIndicator.shared.hideTouch(touch)
            default:
                break
            }
        }
    }
}
