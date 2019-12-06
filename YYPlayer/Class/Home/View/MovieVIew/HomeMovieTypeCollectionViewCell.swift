//
//  HomeMovieTypeCollectionViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/3.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class HomeMovieTypeCollectionViewCell: UICollectionViewCell {
    let contentLab = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = CB_ChooseLabColor
        contentLab.font = CB_contentFont()
        contentLab.textColor = .white
        contentView.layer.cornerRadius = 3
        contentView.addSubview(contentLab)
        contentLab.snp.makeConstraints { (m) in
            m.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
