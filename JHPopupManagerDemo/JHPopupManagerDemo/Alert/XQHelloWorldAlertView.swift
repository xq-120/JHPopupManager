//
//  XQHelloWorldAlertView.swift
//  JHPopupManagerDemo
//
//  Created by 薛权 on 2025/7/11.
//

import UIKit
import JHPopupManager

class XQHelloWorldAlertView: UIView, JHPopupViewProtocol {
    
    var isShowing: Bool {
        return self.window != nil
    }
    
    var identifier: String {
        return ""
    }
    
    var priority: Int {
        return 0
    }
    
    weak var inView: UIView?
    
    deinit {
        NSLog("==>dealloc")
    }
    
    func jh_show(animated: Bool, completion: (() -> Void)?) {
        inView?.addSubview(self)
        self.center = inView?.center ?? .zero
        
        self.alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        } completion: { finish in
            completion?()
        }
    }
    
    func jh_hidden(animated: Bool, completion: (() -> Void)?) {
        self.removeFromSuperview()
        NSLog("==>关闭弹窗")
    }
    
    func shouldPopup(in viewController: UIViewController?) -> Bool {
        return true
    }
    
    var textLabel: UILabel = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(textLabel)
        textLabel.text = "hello,world!"
        textLabel.sizeToFit()
        textLabel.center = self.center
        self.backgroundColor = .green
        self.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
