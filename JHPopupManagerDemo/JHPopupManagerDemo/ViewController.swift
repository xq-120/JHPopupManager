//
//  ViewController.swift
//  JHPopupManagerDemo
//
//  Created by uzzi on 2025/6/11.
//

import UIKit
import JHPopupManager


class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    private lazy var submitBtn: UIButton = {
        let tempBtn = UIButton(type: .custom)
        tempBtn.setTitleColor(UIColor.black, for: .normal)
        tempBtn.setTitle("去玩耍", for: .normal)
        tempBtn.titleLabel?.font = .systemFont(ofSize: 16)
        tempBtn.backgroundColor = .white
        tempBtn.addTarget(self, action: #selector(onTapSubmitBtn(_:)), for: .touchUpInside)
        return tempBtn
    }()
    
    private lazy var chatBtn: UIView = {
        let v = UIView.init(frame: CGRectMake(0, 0, 200, 44))
        v.backgroundColor = .cyan
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(submitBtn)
        
        submitBtn.sizeToFit()
        submitBtn.center = view.center
        
        chatBtn.frame = CGRect(x: 50, y: CGRectGetMaxY(submitBtn.frame) + 100, width: 200, height: 44)
        
        let alert0 = XQHelloWorldAlertView(frame: CGRect.init(x: 0, y: 0, width: 222, height: 222))
        alert0.inView = self.view
        JHPopupManager.show(popupView: alert0, animated: true) {
            NSLog("AuditionEndBuyAlertView弹出")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            alert0.jh_hidden(animated: true, completion: nil)
        })
        let alert1 = AuditionEndBuyAlertView.init()
        alert1.inView = self.view
        JHPopupManager.show(popupView: alert1, animated: true) {
            NSLog("AuditionEndBuyAlertView弹出")
        }
        let alert2 = BroadcastBeginAlertView.init()
        JHPopupManager.show(popupView: alert2, animated: true) {
            NSLog("BroadcastBeginAlertView弹出")
        }
        let alert3 = LoveKeyAlertPopupView.init()
        alert3.priority = 100
        JHPopupManager.show(popupView: alert3, animated: true) {
            NSLog("LoveKeyAlertPopupView弹出")
        }
        let alert3_1 = JKPublishCommentAlertViewController.init()
        JHPopupManager.show(popupView: alert3_1, animated: true) {
            NSLog("LoveKeyAlertPopupView弹出")
        }
        let alert4 = SupportGroupVoteAlertView.init()
        JHPopupManager.show(popupView: alert4, animated: true) {
            NSLog("SupportGroupVoteAlertView弹出")
        }
    }
    
    
    @objc func onTapSubmitBtn(_ sender: UIButton) {
        NSLog("点击按钮")
//        addPulseAnimation(view: chatBtn)
        let vc = TeacherDetailViewController.init()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func addPulseAnimation(view: UIView) {
        let basicAnimation = CABasicAnimation.init(keyPath: "transform.scale")
        basicAnimation.fromValue = 0.95
        basicAnimation.toValue = 1.0
        basicAnimation.duration = 0.6;
        basicAnimation.repeatCount = 3;
        basicAnimation.autoreverses = true;
        basicAnimation.isRemovedOnCompletion = false;
        basicAnimation.fillMode = .forwards;
        view.layer.add(basicAnimation, forKey: "pulse")
    }
}

