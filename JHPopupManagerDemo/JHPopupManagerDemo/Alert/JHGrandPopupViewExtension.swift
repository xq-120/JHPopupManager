//
//  JHGrandPopupViewExtension.swift
//  JHPopupManagerDemo
//
//  Created by uzzi on 2025/6/26.
//

import Foundation
import JHPopupManager
import JHGrandPopupView //oc类

extension JHGrandPopupView: @retroactive JHPopupViewProtocol {
    public var isShowing: Bool {
        return self.window != nil
    }
    
    public var identifier: String {
        return ""
    }
    
    public func jh_show(animated: Bool, completion: (() -> Void)?) {
        if self.inView == nil {
            self.inView = GetAppWindow()
        }
        self.show(in: self.inView, animated: animated, completion: completion)
    }
    
    public func jh_hidden(animated: Bool, completion: (() -> Void)?) {
        self.hiddenWith(animated: animated, completion: completion)
    }
    
    public func shouldPopup(in viewController: UIViewController?) -> Bool {
        return true 
    }
}

extension JHGrandPopupViewController: @retroactive JHPopupViewProtocol {
    public var isShowing: Bool {
        return self.view.window != nil
    }
    
    public var identifier: String {
        return ""
    }
    
    public var priority: Int {
        return 0
    }
    
    public func jh_show(animated: Bool, completion: (() -> Void)?) {
        if self.inViewController == nil {
            self.inViewController = JHUtils.topViewController()!
        }
        self.show(in: self.inViewController!, animated: animated, completion: completion)
    }
    
    public func jh_hidden(animated: Bool, completion: (() -> Void)?) {
        self.hiddenWith(animated: animated, completion: completion)
    }
    
    public func shouldPopup(in viewController: UIViewController?) -> Bool {
        return true
    }
}
