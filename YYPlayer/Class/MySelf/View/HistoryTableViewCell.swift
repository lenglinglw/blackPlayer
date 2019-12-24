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
        
        selectionStyle = .none
        self.backgroundColor = .white
        iconImageView.layer.cornerRadius = 4
        iconImageView.backgroundColor    = .red
        self.addSubview(iconImageView)
        iconImageView.snp_makeConstraints { (m) in
            m.left.equalToSuperview().offset(16)
            m.centerY.equalToSuperview()
            m.height.equalTo(100)
            m.width.equalTo(170)
            m.bottom.equalToSuperview().offset(-16)
        }
        nameLab.text = "中国机长"
        nameLab.font = CB_titleFont()
        nameLab.textColor = CB_titleLabTextColor
        nameLab.numberOfLines = 2
        self.addSubview(nameLab)
        nameLab.snp_makeConstraints { (m) in
            m.top.equalTo(iconImageView)
            m.left.equalTo(iconImageView.snp_right).offset(16)
            m.right.equalToSuperview().offset(-16)
        }
        
        seeRateLab.text = "剩余43分钟"
        seeRateLab.font = CB_titleFont()
        seeRateLab.textColor = CB_titleLabColor
        self.addSubview(seeRateLab)
        seeRateLab.snp_makeConstraints { (m) in
            m.bottom.equalTo(iconImageView)
            m.left.equalTo(iconImageView.snp_right).offset(16)
            m.right.equalToSuperview().offset(-16)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
