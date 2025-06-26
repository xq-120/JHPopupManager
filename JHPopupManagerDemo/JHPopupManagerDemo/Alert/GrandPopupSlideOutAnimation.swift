//
//  GrandPopupSlideOutAnimation.swift
//  JHGrandPopupViewDemo
//
//  Created by ailiao on 2024/11/14.
//

import Foundation
import JHGrandPopupView

class GrandPopupSlideOutAnimation: NSObject, JHGrandPopupViewAnimationProtocol {
    func animate(with popupView: JHGrandPopupView, completion: (() -> Void)?) {
        var toFrame = popupView.contentView.frame
        toFrame.origin.y = popupView.frame.size.height + popupView.contentView.frame.size.height

        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut) {
            popupView.alpha = 0
            popupView.contentView.frame = toFrame
        } completion: { (finished) in
            completion?()
        }
    }
}
