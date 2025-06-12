//
//  JHPopupManager.swift
//  JHPopupManagerDemo
//
//  Created by uzzi on 2025/6/11.
//

import UIKit

public class JHPopupManager {
    
    static let manager = JHPopupManager.init()
    
    private var popupItems: [JHPopupItem] = []
    
    private var curPopupItem: JHPopupItem?
    
    static public func show(popupView: JHPopupViewProtocol, in view: UIView?, animated: Bool, completion: (() -> Void)?) {
        let item = JHPopupItem.init(popupView: popupView, type: .view)
        item.view = view
        item.animated = animated
        item.onShowCompletion = completion
        JHPopupManager.manager.enqueue(item)
    }
    
    static public func show(popupView: JHPopupViewProtocol, in viewController: UIViewController?, animated: Bool, completion: (() -> Void)?) {
        let item = JHPopupItem.init(popupView: popupView, type: .viewController)
        item.viewController = viewController
        item.animated = animated
        item.onShowCompletion = completion
        JHPopupManager.manager.enqueue(item)
    }
    
    static public func hidden(popupView: JHPopupViewProtocol, animated: Bool, completion: (() -> Void)?) {
        JHPopupManager.manager.hidden(popupView: popupView, animated: animated, completion: completion)
    }
    
    func hidden(popupView: JHPopupViewProtocol, animated: Bool, completion: (() -> Void)?) {
        if curPopupItem?.popupView === popupView {
            popupView.hidden(withAnimated: animated, completion: completion)
            curPopupItem = nil
        } else {
            remove(popupView)
        }
    }
    
    func remove(_ popupView: JHPopupViewProtocol) {
        if let index = popupItems.firstIndex(where: {$0 === popupView}) {
            popupItems.remove(at: index)
        }
    }
    
    func enqueue(_ item: JHPopupItem) {
        popupItems.append(item)
    }
    
    func dequeue() {
        if popupItems.isEmpty {
            return
        }
        
        var poppingItemIndex: Int? = nil
        for (index, item) in popupItems.enumerated() {
            if item.popupView.shouldPopup(in: topViewController()) {
                poppingItemIndex = index
                break
            }
        }
        guard let index = poppingItemIndex else { return }
        
        let item = popupItems.remove(at: index)
        show(item)
    }
    
    func show(_ item: JHPopupItem) {
        curPopupItem = item
        
        if item.type == .view {
            item.popupView.show(in: item.view, animated: item.animated, completion: item.onShowCompletion)
        } else {
            item.popupView.show(in: item.viewController, animated: item.animated, completion: item.onShowCompletion)
        }
    }
    
    //MARK: - 工具方法
    func topViewController() -> UIViewController? {
        let window = UIApplication.shared.delegate?.window
        guard window != nil, let rootViewController = window?!.rootViewController else {
            return nil
        }
        return self.getTopViewController(controller: rootViewController)
    }
    
    func getTopViewController(controller: UIViewController) -> UIViewController {
        if let presentedViewController = controller.presentedViewController {
            return self.getTopViewController(controller: presentedViewController)
        } else if let navigationController = controller as? UINavigationController {
            if let topViewController = navigationController.topViewController {
                return self.getTopViewController(controller: topViewController)
            }
            return navigationController
        } else if let tabbarController = controller as? UITabBarController {
            if let selectedViewController = tabbarController.selectedViewController {
                return self.getTopViewController(controller: selectedViewController)
            }
            return tabbarController
        } else {
            return controller
        }
    }
}


