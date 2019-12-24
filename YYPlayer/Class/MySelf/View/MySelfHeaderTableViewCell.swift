//
//  MySelfHeaderTableViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/4.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class MySelfHeaderTableViewCell: UITableViewCell {

    let headerImageView = UIImageView.init()
    /// 名称
    let nameLab         = UILabel.init()
    /// 资料完善
    let infoBtyn        = UIButton.init(type: .custom)
    /// 会员等级
    let levelLab        = UILabel.init()
    
    let signBtn         = UIButton.init(type: .custom)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        self.backgroundColor = .white
        headerImageView.backgroundColor = .white
        headerImageView.image = UIImage(named: "home_derive")
        headerImageView.layer.cornerRadius = 35
        self.addSubview(headerImageView)
        headerImageView.snp_makeConstraints { (m) in
            m.left.equalToSuperview().offset(16)
            m.width.height.equalTo(70)
            m.top.equalToSuperview().offset(30)
        }
        
        signBtn.setTitle("签到", for: .normal)
        nameLab.text = "名称"
        nameLab.font = CB_titleFont()
        nameLab.textColor = CB_titleLabTextColor
        self.addSubview(nameLab)
        nameLab.snp_makeConstraints { (m) in
            m.top.equalTo(headerImageView.snp_bottom).offset(8)
            m.left.equalToSuperview().offset(16)
        }
        
        infoBtyn.setTitle("完善资料", for: .normal)
        infoBtyn.setTitleColor(CB_ChooseLabColor, for: .normal)
        infoBtyn.titleLabel?.font = CB_contentFont()
        self.addSubview(infoBtyn)
        infoBtyn.snp_makeConstraints { (m) in
            m.centerY.equalTo(nameLab)
            m.left.equalTo(nameLab.snp_right).offset(3)
        }
        
        levelLab.text = "等级"
        levelLab.font = CB_titleFont()
        levelLab.textColor = CB_titleLabTextColor
        self.addSubview(levelLab)
        levelLab.snp_makeConstraints { (m) in
            m.top.equalTo(nameLab.snp_bottom).offset(8)
            m.left.equalToSuperview().offset(16)
            m.bottom.equalToSuperview().offset(-16)
        }
        let spaceView = UIView.init()
        spaceView.backgroundColor = CB_lightGaryBgViewColor
        self.addSubview(spaceView)
        spaceView.snp_makeConstraints { (m) in
            m.bottom.left.right.equalToSuperview()
            m.height.equalTo(4)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
