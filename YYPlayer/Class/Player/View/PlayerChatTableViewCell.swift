//
//  PlayerChatTableViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/5.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class PlayerChatTableViewCell: UITableViewCell {

    let headerImageView = UIImageView.init()
    let nameLab         = UILabel.init()
    let timeLab         = UILabel.init()
    let contentLab      = UILabel.init()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        headerImageView.layer.cornerRadius = 22
        headerImageView.backgroundColor    = .red
        self.addSubview(headerImageView)
        headerImageView.snp_makeConstraints { (m) in
            m.left.top.equalToSuperview().offset(16)
            m.height.width.equalTo(44)
        }
        
        nameLab.text      = "夜月"
        nameLab.textColor = CB_titleLabTextColor
        nameLab.font      = CB_contentFont()
        self.addSubview(nameLab)
        nameLab.snp_makeConstraints { (m) in
            m.top.equalTo(headerImageView).offset(4)
            m.left.equalTo(headerImageView.snp_right).offset(8)
        }
        
        timeLab.text      = "12-6"
        timeLab.textColor = CB_titleLabTextColor
        timeLab.font      = UIFont.systemFont(ofSize: 11)
        self.addSubview(timeLab)
        timeLab.snp_makeConstraints { (m) in
            m.bottom.equalTo(headerImageView).offset(-4)
            m.left.equalTo(headerImageView.snp_right).offset(8)
        }

        
        contentLab.text      = "简单的测试一下看一下到底行不行可不可以用这个玩意,简单的测试一下看一下到底行不行可不可以用这个玩意简单的测试一下看一下到底行不行可不可以用这个玩意简单的测试一下看一下到底行不行可不可以用这个玩意简单的测试一下看一下到底行不行可不可以用这个玩意简单的测试一下看一下到底行不行可不可以用这个玩意简单的测试一下看一下到底行不行可不可以用这个玩意简单的测试一下看一下到底行不行可不可以用这个玩意简单的测试一下看一下到底行不行可不可以用这个玩意"
        contentLab.textColor = CB_titleLabTextColor
        contentLab.font      = UIFont.systemFont(ofSize: 11)
        contentLab.numberOfLines = 6
        self.addSubview(contentLab)
        contentLab.snp_makeConstraints { (m) in
            m.top.equalTo(headerImageView.snp_bottom).offset(8)
            m.left.equalToSuperview().offset(16)
            m.right.equalToSuperview().offset(-16)
            m.bottom.equalToSuperview().offset(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
