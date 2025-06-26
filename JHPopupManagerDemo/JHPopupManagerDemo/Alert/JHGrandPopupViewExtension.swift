//
//  JHGrandPopupViewExtension.swift
//  JHPopupManagerDemo
//
//  Created by uzzi on 2025/6/26.
//

import Foundation
import JHPopupManager
import JHGrandPopupView

extension JHGrandPopupView: @retroactive JHPopupViewProtocol {
    
    
    public var identifier: String {
        get {
            return ""
        }
        set(newValue) {
            
        }
    }
    
    public var priority: Int {
        get {
            return 0
        }
        set(newValue) {
            
        }
    }
    
    public func show(in viewController: UIViewController?, animated: Bool, completion: (() -> Void)?) {
        
    }
    
    public func hidden(withAnimated animated: Bool, completion: (() -> Void)?) {
        self.hiddenWith(animated: animated, completion: completion)
    }
    
    public func shouldPopup(in viewController: UIViewController?) -> Bool {
        return true 
    }
}
