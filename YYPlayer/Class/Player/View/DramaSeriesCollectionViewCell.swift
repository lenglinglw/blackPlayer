//
//  DramaSeriesCollectionViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/6.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class DramaSeriesCollectionViewCell: UICollectionViewCell {
    
    let numLab = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = CB_lightGaryBgViewColor
        self.layer.cornerRadius = 3
        numLab.text      = "01"
        numLab.textColor = CB_titleLabTextColor
        numLab.font      = CB_contentFont()
        self.addSubview(numLab)
        numLab.snp_makeConstraints { (m) in
            m.center.equalToSuperview()
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
