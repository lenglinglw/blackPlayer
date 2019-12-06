//
//  ContentInfoTableViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/5.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

typealias moreInfoBtnBlock = () -> ()

class ContentInfoTableViewCell: UITableViewCell {
    
    let nameLab     = UILabel.init()
    let numLab      = UILabel.init()
    let typeLab     = UILabel.init()
    let moreInfoBtn = UIButton.init(type: .custom)
    var block: (() -> ())?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLab.text      = "中国机长"
        nameLab.textColor = CB_titleLabTextColor
        nameLab.font      = CB_contentFont()
        self.addSubview(nameLab)
        nameLab.snp_makeConstraints { (m) in
            m.top.left.equalToSuperview().offset(16)
        }
        
        moreInfoBtn.setTitle("简介", for: .normal)
        moreInfoBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        moreInfoBtn.setTitleColor(CB_lightGaryTitleLabColor, for: .normal)
        moreInfoBtn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        self.addSubview(moreInfoBtn)
        moreInfoBtn.snp_makeConstraints { (m) in
            m.centerY.equalTo(nameLab)
            m.right.equalToSuperview().offset(-16)
            m.height.equalTo(20)
        }
        
        numLab.text      = "8.7分"
        numLab.textColor = CB_titleLabTextColor
        numLab.font      = CB_contentFont()
        self.addSubview(numLab)
        numLab.snp_makeConstraints { (m) in
            m.top.equalTo(nameLab.snp_bottom).offset(8)
            m.left.equalToSuperview().offset(16)
        }
        
        typeLab.text      = "1024热度·vip·1024播放"
        typeLab.textColor = CB_titleLabTextColor
        typeLab.font      = CB_contentFont()
        self.addSubview(typeLab)
        typeLab.snp_makeConstraints { (m) in
            m.top.equalTo(numLab.snp_bottom).offset(8)
            m.left.equalToSuperview().offset(16)
            m.bottom.equalToSuperview().offset(-16)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func btnClick() {
        
        guard block != nil else {
            return
        }
        block!()
    }
    
}
