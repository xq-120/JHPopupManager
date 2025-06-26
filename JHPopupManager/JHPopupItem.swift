//
//  JHPopupItem.swift
//  JHPopupManager
//
//  Created by uzzi on 2025/6/12.
//

import Foundation

enum JHPopupByType {
    case view
    case viewController
}

class JHPopupItem {
    var popupView: JHPopupViewProtocol
    
    weak var view: UIView?
    
    weak var viewController: UIViewController?
    
    var type: JHPopupByType = .view
    
    var animated: Bool = true
    
    var onShowCompletion: (()->Void)?
    
    init(popupView: JHPopupViewProtocol, type: JHPopupByType) {
        self.popupView = popupView
        self.type = type
    }
}
