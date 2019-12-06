//
//  MySelfCollectionViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/4.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class MySelfCollectionViewCell: UICollectionViewCell {
    
    let iconImageView = UIImageView.init()
    let titleLab      = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.addSubview(iconImageView)
        iconImageView.snp_makeConstraints { (m) in
            m.centerX.equalToSuperview()
            m.centerY.equalToSuperview().offset(-10)
            m.width.height.equalTo(44)
        }
        titleLab.text = "收藏"
        titleLab.font = CB_titleFont()
        titleLab.textColor = CB_titleLabTextColor
        self.addSubview(titleLab)
        titleLab.snp_makeConstraints { (m) in
            m.centerX.equalToSuperview()
            m.bottom.equalToSuperview().offset(-4)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
