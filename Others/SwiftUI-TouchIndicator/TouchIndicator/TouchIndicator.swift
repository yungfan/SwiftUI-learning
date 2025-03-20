//
//  TouchIndicator.swift
//  TouchIndicator
//  功能：触摸指示器，截图、录屏均可以保存
//  使用：拖入项目即可使用，无需任何其他操作
//
//  Created by 杨帆 on 2025/3/19.
//

import UIKit

/// 触摸指示器类V1，用于显示触摸反馈，类似模拟器自带的触摸效果
final class TouchIndicatorOld {
    static let shared = TouchIndicatorOld()
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

        // 将触摸指示器添加到窗口
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
        touchView.center = location
    }

    /// 移除触摸指示器并播放淡出动画
    /// - Parameter touch: 触摸事件对象
    func hideTouch(_ touch: UITouch) {
        guard let touchView = touchViews[touch] else { return }
        // 添加淡出动画
        UIView.animate(withDuration: 0.2, delay: 0, options: [.beginFromCurrentState], animations: {
            touchView.alpha = 0
        }) { [weak self] _ in
            touchView.removeFromSuperview() // 动画完成后移除视图
            self?.touchViews[touch] = nil // 移除存储的引用
        }
    }
}

/// 触摸指示器类V2，用于显示触摸反馈，实现自定义图片与涟漪的触摸效果，支持长按悬停
final class TouchIndicatorNew {
    static let shared = TouchIndicatorNew()
    /// 存储所有活动的触摸视图
    private var touchViews = [UITouch: (indicator: UIView, ripple: UIView)]()
    /// 触摸指示器的图片
    private lazy var touchImage: UIImage? = {
        UIImage(systemName: "hand.point.up.left.fill")
    }()

    /// 创建并显示一个新的触摸指示器视图
    /// - Parameters:
    ///   - touch: 触摸事件对象
    ///   - window: 触摸发生的窗口
    func showTouch(_ touch: UITouch, in window: UIWindow) {
        let location = touch.location(in: window)
        let width: CGFloat = 20
        // 创建触摸指示器视图
        let touchView = UIImageView(frame: CGRect(x: location.x - width * 0.5,
                                                  y: location.y - width * 0.5,
                                                  width: width,
                                                  height: width))
        touchView.image = touchImage
        touchView.tintColor = UIColor.systemGray.withAlphaComponent(0.8)

        // 创建涟漪效果视图
        let rippleSize: CGFloat = 30
        let rippleView = UIView(frame: CGRect(x: location.x - rippleSize * 0.5,
                                              y: location.y - rippleSize * 0.5,
                                              width: rippleSize,
                                              height: rippleSize))
        rippleView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.5)
        rippleView.layer.cornerRadius = rippleSize * 0.5
        // 将触摸指示器、涟漪效果添加到窗口
        window.addSubview(rippleView)
        window.addSubview(touchView)
        touchViews[touch] = (touchView, rippleView)

        // 添加动画
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut], animations: {
            rippleView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            touchView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        })
    }

    /// 更新已存在的触摸指示器的位置
    /// - Parameters:
    ///   - touch: 触摸事件对象
    ///   - window: 触摸发生的窗口
    func updateTouch(_ touch: UITouch, in window: UIWindow) {
        guard let views = touchViews[touch] else { return }
        let location = touch.location(in: window)
        views.indicator.center = location
        views.ripple.center = location
    }

    /// 移除触摸指示器并播放淡出动画
    /// - Parameter touch: 触摸事件对象
    func hideTouch(_ touch: UITouch) {
        guard let views = touchViews[touch] else { return }
        // 停止所有动画
        views.ripple.layer.removeAllAnimations()
        views.indicator.layer.removeAllAnimations()
        // 添加动画
        UIView.animate(withDuration: 0.5, delay: 0, options: [.beginFromCurrentState], animations: {
            views.indicator.alpha = 0
            views.ripple.alpha = 0
        }) { [weak self] _ in
            views.indicator.removeFromSuperview()
            views.ripple.removeFromSuperview() // 动画完成后移除视图
            self?.touchViews[touch] = nil // 移除存储的引用
        }
    }
}

// MARK: - UIWindow Extension
extension UIWindow {
    /// 标记是否已经完成方法交换
    private static var isSwizzled = false

    /// 重写layer属性，用于触发方法交换
    override open var layer: CALayer {
        Self.swizzleImplementations()
        return super.layer
    }

    /// 执行方法交换，替换原始的sendEvent方法
    private static func swizzleImplementations() {
        guard !isSwizzled else { return } // 确保只交换一次
        isSwizzled = true
        // 获取原始方法和新方法
        let originalSelector = #selector(sendEvent(_:))
        let swizzledSelector = #selector(swizzled_sendEvent(_:))
        guard let originalMethod = class_getInstanceMethod(self, originalSelector),
              let swizzledMethod = class_getInstanceMethod(self, swizzledSelector) else { return }
        // 交换方法实现
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }

    /// 新的事件处理方法，在原始方法的基础上添加触摸指示器功能
    @objc private func swizzled_sendEvent(_ event: UIEvent) {
        // 调用原始实现（因为方法已经交换，这里实际调用的是原始的sendEvent方法）
        swizzled_sendEvent(event)
        // 具体的TouchIndicator
        let touchIndicator = TouchIndicatorNew.shared

        // 处理所有触摸事件
        event.allTouches?.forEach { touch in
            switch touch.phase {
            case .began: // 触摸开始
                touchIndicator.showTouch(touch, in: self)
            case .moved, .stationary: // 触摸移动或静止
                touchIndicator.updateTouch(touch, in: self)
            case .cancelled, .ended: // 触摸取消或结束
                touchIndicator.hideTouch(touch)
            default:
                break
            }
        }
    }
}
