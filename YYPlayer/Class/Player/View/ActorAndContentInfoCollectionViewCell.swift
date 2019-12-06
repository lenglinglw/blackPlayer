//
//  ActorAndContentInfoCollectionViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/6.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class ActorAndContentInfoCollectionViewCell: UICollectionViewCell {
    let picImageView = UIImageView.init()
    /// 名称
    let nameLab      = UILabel.init()
    /// 简单描述
    let contentLab   = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        picImageView.layer.cornerRadius = 3
        self.addSubview(picImageView)
        picImageView.snp_makeConstraints { (m) in
            m.top.left.right.equalToSuperview()
            m.height.equalTo(100)
        }
        
        nameLab.font = CB_titleFont()
        nameLab.text = "见龙卸甲"
        nameLab.textColor = CB_titleLabTextColor
        self.addSubview(nameLab)
        nameLab.snp_makeConstraints { (m) in
            m.left.equalToSuperview().offset(8)
            m.top.equalTo(picImageView.snp_bottom).offset(8)
            m.height.equalTo(20)
            m.right.equalToSuperview().offset(-8)
        }
        
        contentLab.font = CB_contentFont()
        contentLab.text = "见龙卸甲"
        contentLab.textColor = CB_lightGaryTitleLabColor
        self.addSubview(contentLab)
        contentLab.snp_makeConstraints { (m) in
            m.left.equalToSuperview().offset(8)
            m.top.equalTo(nameLab.snp_bottom).offset(4)
            m.height.equalTo(20)
            m.right.equalToSuperview().offset(-8)
        }
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

}


