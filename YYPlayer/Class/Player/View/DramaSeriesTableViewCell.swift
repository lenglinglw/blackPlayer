//
//  DramaSeriesTableViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/6.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class DramaSeriesTableViewCell: UITableViewCell {

    var chooseCell: Int = -1
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let lab       = UILabel.init()
        lab.text      = "中国机长"
        lab.textColor = CB_titleLabTextColor
        lab.font      = CB_contentFont()
        self.addSubview(lab)
        lab.snp_makeConstraints { (m) in
            m.top.left.equalToSuperview().offset(16)
        }
        selectionStyle = .none
        let flowLayout = UICollectionViewFlowLayout()
        //设置cell尺寸
        flowLayout.itemSize = CGSize(width: 64, height: 64)
        //设置滑动方向
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        //创建UICollectView对象
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kAppWidth, height: 130), collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DramaSeriesCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "DramaSeriesCollectionViewCell")
        self.addSubview(collectionView)
        collectionView.snp_makeConstraints { (m) in
            m.top.equalTo(lab.snp_bottom).offset(8)
            m.left.right.equalToSuperview()
            m.bottom.equalToSuperview().offset(-8)
            m.height.equalTo(64)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DramaSeriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DramaSeriesCollectionViewCell", for: indexPath) as! DramaSeriesCollectionViewCell
        if chooseCell == indexPath.row {
            cell.numLab.textColor = .white
            cell.backgroundColor  = CB_ChooseLabColor
        } else {
            cell.numLab.textColor = CB_titleLabTextColor
            cell.backgroundColor  = CB_lightGaryBgViewColor
        }
        cell.numLab.text = String(indexPath.row)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard chooseCell != indexPath.row else {
            return
        }
        chooseCell = indexPath.row
        collectionView.reloadData()
    }
    
    //每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    //最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    // 最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
