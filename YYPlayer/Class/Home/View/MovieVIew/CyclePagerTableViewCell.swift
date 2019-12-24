//
//  CyclePagerTableViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/3.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class CyclePagerTableViewCell: UICollectionViewCell {

    let headerImageView = UIImageView.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        headerImageView.backgroundColor = .red
        headerImageView.layer.cornerRadius = 4
        self.addSubview(headerImageView)
        headerImageView.snp_makeConstraints { (m) in
            m.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
