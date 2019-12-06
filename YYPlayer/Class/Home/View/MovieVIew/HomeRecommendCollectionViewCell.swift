//
//  HomeRecommendCollectionViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/4.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class HomeRecommendCollectionViewCell: UICollectionViewCell {
    let picImageView = UIImageView.init()
    /// 独播,付费,vip等类型图片
    let iconImageView = UIImageView.init()
    /// 电影评分
    let timeLab       = UILabel.init()
    /// 电影名称
    let nameLab       = UILabel.init()
    /// 电影简单描述
    let contentLab    = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(picImageView)
        picImageView.layer.cornerRadius = 3
        picImageView.snp_makeConstraints { (m) in
            m.centerX.equalToSuperview()
            m.top.equalToSuperview().offset(3)
            m.height.equalTo((kAppWidth - 24) / 2 * 0.65)
            m.width.equalTo((kAppWidth - 24) / 2)
        }
        
        picImageView.addSubview(iconImageView)
        iconImageView.snp_makeConstraints { (m) in
            m.right.equalToSuperview()
            m.top.equalToSuperview().offset(6)
        }
        
        timeLab.font = UIFont.systemFont(ofSize: 12)
        timeLab.text = "更新至12集"
        timeLab.textColor = .white
        picImageView.addSubview(timeLab)
        timeLab.snp_makeConstraints { (m) in
            m.right.bottom.equalToSuperview().offset(-6)
        }
        
        nameLab.font = CB_titleFont()
        nameLab.text = "见龙卸甲"
        nameLab.textColor = CB_titleLabTextColor
        self.addSubview(nameLab)
        nameLab.snp_makeConstraints { (m) in
            m.left.equalToSuperview().offset(8)
            m.top.equalTo(picImageView.snp_bottom).offset(3)
            m.height.equalTo(20)
            m.right.equalToSuperview().offset(-8)
        }
        
        contentLab.font = CB_contentFont()
        contentLab.text = "见龙卸甲"
        contentLab.textColor = CB_lightGaryTitleLabColor
        self.addSubview(contentLab)
        contentLab.snp_makeConstraints { (m) in
            m.left.equalToSuperview().offset(8)
            m.top.equalTo(nameLab.snp_bottom).offset(2)
            m.height.equalTo(20)
            m.right.equalToSuperview().offset(-8)
        }
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

}
