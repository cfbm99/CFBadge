//
//  UITabBarItem+CFBadge.swift
//  CFBadgeDemo
//
//  Created by Apple on 2017/9/11.
//  Copyright © 2017年 cf. All rights reserved.
//

import UIKit

private var badgeKey: Void?

extension UITabBarItem {
    //private vars
    fileprivate var cfBadge: CFBadge? {
        get {
            if let badge = objc_getAssociatedObject(self, &badgeKey) as? CFBadge {
                return badge
            } else {
                return nil
            }
        }
        set {
            objc_setAssociatedObject(self, &badgeKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var uiTabBarButton: UIView? {
        guard let uinavigationButton = value(forKey: "_view") as? UIView else { return nil }
        for subView in uinavigationButton.subviews {
            if subView is UIImageView {
                subView.clipsToBounds = false
                return subView
            }
        }
        return nil
    }
    
    //private funcs
    fileprivate func initCFBadge() -> CFBadge {
        if let badge = cfBadge {
            return badge
        } else {
            let badge = CFBadge()
            uiTabBarButton?.addSubview(badge)
            cfBadge = badge
            return badge
        }
    }
    
    //public funcs
    public func showBadge(value: Int, offset: CGPoint?) {
        initCFBadge().showBadge(with: value ,offset: offset)
    }
    
    public func showDot(offset: CGPoint?) {
        initCFBadge().showBadge(with: nil ,offset: offset)
    }
    
    public func hideBadge() {
        if let _ = cfBadge {
            cfBadge?.removeFromSuperview()
            cfBadge = nil
        }
    }

}
