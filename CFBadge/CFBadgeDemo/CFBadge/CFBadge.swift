//
//  CFBadge.swift
//  CFBadgeDemo
//
//  Created by Apple on 2017/9/7.
//  Copyright © 2017年 cf. All rights reserved.
//

import UIKit

class CFBadge: UIView {
    //private vars
    fileprivate lazy var badge: UILabel = {
        let badge = UILabel()
        badge.font = UIFont.systemFont(ofSize: 12)
        badge.textAlignment = .center
        badge.textColor = UIColor.white
        return badge
    }()
    
    fileprivate var badgeValue: Int? {
        didSet {
            badge.text = badgeValue != nil ? badgeValue! > maxBadgeNum ? "99+" : "\(badgeValue!)" : nil
            calculateFrames()
        }
    }
    
    fileprivate var offset: CGPoint = CGPoint(x: 0.5, y: 0.5)
    fileprivate let maxBadgeNum = 99
    
    //private funcs
    fileprivate override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        self.addSubview(badge)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func calculateFrames() {
        guard let supperV = superview else { return }
        if let _ = badgeValue {
            // show badge
            badge.isHidden = false
            badge.sizeToFit()
            var width = badge.frame.width + 8
            let height = badge.frame.height + 5
            if width < height {
                width = height
            }
            layoutCFBadge(supperView: supperV, width: width, height: height)
        } else {
            // show dot
            badge.isHidden = true
            layoutCFBadge(supperView: supperV, width: 10, height: 10)
        }
        setNeedsDisplay()
    }
    
    fileprivate func layoutCFBadge(supperView: UIView, width: CGFloat, height: CGFloat) {
        if let button = supperView as? UIButton, let buttonImageView = button.imageView {
            let imageViewFrame = buttonImageView.frame
            self.frame = CGRect(x: imageViewFrame.maxX - width * offset.x, y: imageViewFrame.minY - height * offset.y , width: width, height: height)
        } else {
            self.frame = CGRect(x: supperView.frame.width - width * offset.x, y: -height * offset.y , width: width, height: height)
        }
        badge.center = CGPoint(x: width / 2, y: height / 2)
    }
    
    //public funcs
    public func showBadge(with value: Int?, offset: CGPoint?) {
        if let offset = offset {
            self.offset = offset
        }
        badgeValue = value
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        var frame = self.bounds
        frame.origin.x += 1
        frame.origin.y += 1
        frame.size.width -= 2
        frame.size.height -= 2
        let path = UIBezierPath(roundedRect: frame, cornerRadius: self.frame.height / 2)
        UIColor.red.setFill()
        path.fill()
    }
    

}
