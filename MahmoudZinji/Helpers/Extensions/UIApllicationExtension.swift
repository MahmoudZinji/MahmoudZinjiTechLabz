//
//  UIApllicationExtension.swift
//  Storzati
//
//  Created by User on 10/05/2021.
//

import Foundation
import UIKit

extension UIApplication {

    var statusBarUIView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 38482458385
            
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            
            if let statusBar = window?.viewWithTag(tag) {
                return statusBar
            } else {
//                window?.windowScene?.statusBarManager?.statusBarFrame
                let statusBarView = UIView(frame: (window?.windowScene?.statusBarManager!.statusBarFrame)!)
                statusBarView.tag = tag

                UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.addSubview(statusBarView)
                return statusBarView
            }
        } else {
            if responds(to: Selector(("statusBar"))) {
                return value(forKey: "statusBar") as? UIView
            }
        }
        return nil
    }

    class func getTopViewController(base: UIViewController? = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }

}
