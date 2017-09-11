//
//  OrderTableViewCell.swift
//  CFBadgeDemo
//
//  Created by Apple on 2017/9/8.
//  Copyright © 2017年 cf. All rights reserved.
//

import UIKit

class customButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let titleLb = titleLabel, let imageView = imageView else { return }
        let imageViewWidth = self.frame.height - 30 - titleLb.frame.height
        imageView.frame = CGRect(x: (self.frame.width - imageViewWidth) / 2, y: 15, width: imageViewWidth, height: imageViewWidth)
        titleLb.frame = CGRect(x: (self.frame.width - titleLb.frame.width) / 2, y: imageView.frame.maxY + 10, width: titleLb.frame.width, height: titleLb.frame.height)
    }
}

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var wxfBtn: customButton!
    @IBOutlet weak var dfkBtn: customButton!
    @IBOutlet weak var dpjBtn: customButton!
    @IBOutlet weak var tkBtn: customButton!
    
    public var badges: (Int, Int, Int, Int)! {
        didSet {
            wxfBtn.showBadge(value: badges.0, offset: nil)
            dfkBtn.showBadge(value: badges.1, offset: nil)
            dpjBtn.showBadge(value: badges.2, offset: nil)
            tkBtn.showBadge(value: badges.3, offset: nil)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
