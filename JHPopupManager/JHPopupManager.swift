//
//  JHPopupManager.swift
//  JHPopupManagerDemo
//
//  Created by uzzi on 2025/6/11.
//

import UIKit

public class JHPopupManager {
    
    public static let manager = JHPopupManager.init()
    
    private var popupItems: [JHPopupItem] = []
    
    private var curPopupItem: JHPopupItem?
    
    private init() {
        let observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, CFRunLoopActivity.allActivities.rawValue, true, 0) { [weak self] ob, activity in
            guard let self = self else {return}
            self.handleRunLoopActivity(activity: activity)
        }
        CFRunLoopAddObserver(CFRunLoopGetMain(), observer, .commonModes)
    }
    
    func handleRunLoopActivity(activity: CFRunLoopActivity) {
        switch activity {
        case .entry:
            NSLog("activity-->entry")
        case .beforeTimers:
            NSLog("activity-->beforeTimers")
        case .beforeSources:
            NSLog("activity-->beforeSources")
        case .beforeWaiting:
            NSLog("activity-->beforeWaiting")
            dequeue()
        case .afterWaiting:
            NSLog("activity-->afterWaiting")
        case .exit:
            NSLog("activity-->exit")
        default:
            NSLog("未知")
        }
    }
    
    static public func show(popupView: JHPopupViewProtocol, animated: Bool, completion: (() -> Void)?) {
        let item = JHPopupItem.init(popupView: popupView)
        item.animated = animated
        item.onShowCompletion = completion
        JHPopupManager.manager.enqueue(item)
    }
    
    static public func hidden(popupView: JHPopupViewProtocol, animated: Bool, completion: (() -> Void)?) {
        JHPopupManager.manager.hidden(popupView: popupView, animated: animated, completion: completion)
    }
    
    func hidden(popupView: JHPopupViewProtocol, animated: Bool, completion: (() -> Void)?) {
        if curPopupItem?.popupView === popupView {
            popupView.hidden(animated: animated, completion: completion)
            curPopupItem = nil
        } else {
            remove(popupView)
        }
    }
    
    func remove(_ popupView: JHPopupViewProtocol) {
        if let index = popupItems.firstIndex(where: {$0.popupView === popupView}) {
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
        
        if curPopupItem != nil {
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
        item.popupView.show(animated: item.animated, completion: item.onShowCompletion)
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


