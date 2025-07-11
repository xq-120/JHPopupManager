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
    public var identifier: String {
        return ""
    }
    
    public var priority: Int {
        return 0
    }
    
    public func show(animated: Bool, completion: (() -> Void)?) {
        self.show(in: self.inView, animated: animated, completion: completion)
    }
    
    public func hidden(animated: Bool, completion: (() -> Void)?) {
        self.hiddenWith(animated: animated, completion: completion)
    }
    
    public func shouldPopup(in viewController: UIViewController?) -> Bool {
        return true 
    }
}
