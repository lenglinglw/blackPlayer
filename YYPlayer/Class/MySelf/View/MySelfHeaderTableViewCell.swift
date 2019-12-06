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
    /// 会员等级
    let levelLab        = UILabel.init()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        headerImageView.backgroundColor = .red
        headerImageView.layer.cornerRadius = 35
        self.addSubview(headerImageView)
        headerImageView.snp_makeConstraints { (m) in
            m.left.equalToSuperview().offset(16)
            m.width.height.equalTo(70)
            m.top.equalToSuperview().offset(30)
            m.bottom.equalToSuperview().offset(-30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
