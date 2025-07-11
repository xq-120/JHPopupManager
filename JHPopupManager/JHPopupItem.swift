//
//  JHPopupItem.swift
//  JHPopupManager
//
//  Created by uzzi on 2025/6/12.
//

import Foundation

class JHPopupItem {
    var popupView: JHPopupViewProtocol
    
    var animated: Bool = true
    
    var onShowCompletion: (()->Void)?
    
    init(popupView: JHPopupViewProtocol) {
        self.popupView = popupView
    }
}
