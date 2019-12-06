//
//  HistoryTableViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/6.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    let iconImageView = UIImageView.init()
    let nameLab       = UILabel.init()
    let seeRateLab    = UILabel.init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageView.layer.cornerRadius = 4
        self.addSubview(iconImageView)
//        iconImageView.snp_m
        
    }

}
