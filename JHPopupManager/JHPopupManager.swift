//
//  JHPopupManager.swift
//  JHPopupManagerDemo
//
//  Created by uzzi on 2025/6/11.
//

import UIKit

public class JHPopupManager {
    
    static let manager = JHPopupManager.init()
    
    private var popupItems: [JHPopupViewProtocol] = []
    
    private var curPopupItem: JHPopupViewProtocol?
    
    public func pop(_ view: JHPopupViewProtocol) {
        popupItems.append(view)
    }
    
    public func close(_ view: JHPopupViewProtocol) {
        if curPopupItem === view {
            view.hidden()
            curPopupItem = nil
        } else {
            remove(view)
        }
    }
    
    func remove(_ view: JHPopupViewProtocol) {
        if let index = popupItems.firstIndex(where: {$0 === view}) {
            popupItems.remove(at: index)
        }
    }
    
    func dequeue() {
        if popupItems.isEmpty {
            return
        }
        let view = popupItems.removeFirst()
        curPopupItem = view
        curPopupItem?.show()
    }
}

