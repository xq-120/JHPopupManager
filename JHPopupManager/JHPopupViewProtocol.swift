//
//  JHPopupViewProtocol.swift
//  JHPopupManager
//
//  Created by uzzi on 2025/6/11.
//

import Foundation

public protocol JHPopupViewProtocol: AnyObject {
    
    var identifier: String { get }
    
    var priority: Int { get }
    
    func show(animated: Bool, completion: (() -> Void)?)
    
    func hidden(animated: Bool, completion: (() -> Void)?)
    
    func shouldPopup(in viewController: UIViewController?) -> Bool
}

extension JHPopupViewProtocol {
    
    var identifier: String {
        return String(describing: self)
    }
    
    var priority: Int {
        return 0
    }
    
    func show(animated: Bool, completion: (() -> Void)?) {}
     
    func hidden(animated: Bool, completion: (() -> Void)?) {}
    
    func shouldPopup(in viewController: UIViewController?) -> Bool {
        return true
    }
}
