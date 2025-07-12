//
//  JHPopupViewProtocol.swift
//  JHPopupManager
//
//  Created by uzzi on 2025/6/11.
//

import Foundation

public protocol JHPopupViewProtocol: AnyObject {
    
    var isShowing: Bool { get }
    
    var identifier: String { get }
    
    /// 优先级默认0，数值越大优先级越高
    var priority: Int { get }
    
    /// 弹出弹窗
    /// - Parameters:
    ///   - animated: 是否动画
    ///   - completion: 弹窗弹出完成回调。
    func jh_show(animated: Bool, completion: (() -> Void)?)
    
    /// 关闭弹窗
    /// - Parameters:
    ///   - animated: 是否动画
    ///   - completion: 弹窗关闭完成回调。
    func jh_hidden(animated: Bool, completion: (() -> Void)?)
    
    func shouldPopup(in viewController: UIViewController?) -> Bool
}

extension JHPopupViewProtocol {
    
    var isShowing: Bool {
        if let vc = self as? UIViewController {
            return vc.view.window != nil
        } else if let view = self as? UIView {
            return view.window != nil
        } else {
            return false
        }
    }
    
    var identifier: String {
        return String(describing: self)
    }
    
    var priority: Int {
        return 0
    }
    
    func jh_show(animated: Bool, completion: (() -> Void)?) {}
     
    func jh_hidden(animated: Bool, completion: (() -> Void)?) {}
    
    func shouldPopup(in viewController: UIViewController?) -> Bool {
        return true
    }
}
