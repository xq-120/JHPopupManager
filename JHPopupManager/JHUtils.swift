//
//  JHUtils.swift
//  JHPopupManager
//
//  Created by 薛权 on 2025/7/12.
//

import Foundation

public class JHUtils {
    //MARK: - 工具方法
    public class func topViewController() -> UIViewController? {
        guard let window = appMainWindow(), let rootViewController = window.rootViewController else {
            return nil
        }
        return self.topViewController(with: rootViewController)
    }
    
    public class func topViewController(with controller: UIViewController) -> UIViewController {
        if let presentedViewController = controller.presentedViewController {
            return self.topViewController(with: presentedViewController)
        } else if let navigationController = controller as? UINavigationController {
            if let topViewController = navigationController.topViewController {
                return self.topViewController(with: topViewController)
            }
            return navigationController
        } else if let tabbarController = controller as? UITabBarController {
            if let selectedViewController = tabbarController.selectedViewController {
                return self.topViewController(with: selectedViewController)
            }
            return tabbarController
        } else {
            return controller
        }
    }
    
    public class func appMainWindow() -> UIWindow? {
        if #available(iOS 13.0, *) {
            // 尝试从 Scene 获取
            let scenes = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .filter { $0.activationState == .foregroundActive }

            if let window = scenes
                .flatMap({ $0.windows })
                .first(where: { $0.windowLevel == .normal }) {
                return window
            }

            // 如果未启用 Scene，尝试 fallback 到 AppDelegate
            return (UIApplication.shared.delegate)?.window ?? nil
        } else {
            return UIApplication.shared.delegate?.window ?? nil
        }
    }
}
