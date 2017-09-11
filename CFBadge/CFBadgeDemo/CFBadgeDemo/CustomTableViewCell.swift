//
//  CustomTableViewCell.swift
//  CFBadgeDemo
//
//  Created by Apple on 2017/9/8.
//  Copyright © 2017年 cf. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var contentLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
