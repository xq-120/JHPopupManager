//
//  JHPopupViewProtocol.swift
//  JHPopupManager
//
//  Created by uzzi on 2025/6/11.
//

import Foundation

public protocol JHPopupViewProtocol: AnyObject {
    
    var identifier: String { get set }
    
    var priority: Int { get set }
    
    func show() -> Void
    
    func hidden() -> Void
    
    func shouldPopup(in viewController: UIViewController) -> Bool
}
