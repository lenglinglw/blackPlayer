//
//  ActorAndContentInfoTableViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/6.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class ActorAndContentInfoTableViewCell: UITableViewCell {

    let nameLab = UILabel.init()
    let contentLab = UILabel.init()
    
    lazy var dataArr: [Dictionary<String,String>] = {
        var dataArr = Array<Dictionary<String, String>>()
        dataArr = [["iconImage":"ceshi_movie_01", "name": "庆余年", "content": "豪华阵容齐上阵"],
                   ["iconImage":"ceshi_movie_02", "name": "奇葩说  第六季","content": "陈铭回归支援薛兆丰战队"],
                   ["iconImage":"ceshi_movie_03", "name": "庆余年", "content": "豪华阵容齐上阵"],
                   ["iconImage":"ceshi_movie_04", "name": "奇葩说  第六季","content": "陈铭回归支援薛兆丰战队"],
                   ["iconImage":"ceshi_movie_05", "name": "庆余年", "content": "豪华阵容齐上阵"],
                   ["iconImage":"ceshi_movie_06", "name": "奇葩说  第六季","content": "陈铭回归支援薛兆丰战队"]]
        return dataArr
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLab.text      = "中国机长"
        nameLab.textColor = CB_titleLabTextColor
        nameLab.font      = CB_titleFont()
        self.addSubview(nameLab)
        nameLab.snp_makeConstraints { (m) in
            m.top.left.equalToSuperview().offset(16)
        }
        
        contentLab.text          = "中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长中国机长"
        contentLab.textColor     = CB_titleLabTextColor
        contentLab.font          = CB_contentFont()
        contentLab.numberOfLines = 0
        self.addSubview(contentLab)
        contentLab.snp_makeConstraints { (m) in
            m.top.equalTo(nameLab.snp_bottom).offset(8)
            m.left.equalToSuperview().offset(16)
            m.right.equalToSuperview().offset(-16)
        }
        
        selectionStyle = .none
        let flowLayout = UICollectionViewFlowLayout()
        //设置cell尺寸
        flowLayout.itemSize = CGSize(width: 80, height: 150)
        //设置滑动方向
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        //创建UICollectView对象
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kAppWidth, height: 130), collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ActorAndContentInfoCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "ActorAndContentInfoCollectionViewCell")
        self.addSubview(collectionView)
        collectionView.snp_makeConstraints { (m) in
            m.top.equalTo(contentLab.snp_bottom).offset(8)
            m.left.right.equalToSuperview()
            m.bottom.equalToSuperview().offset(-8)
            m.height.equalTo(150)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ActorAndContentInfoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActorAndContentInfoCollectionViewCell", for: indexPath) as! ActorAndContentInfoCollectionViewCell
        let dict = dataArr[indexPath.row]
        cell.picImageView.image = UIImage(named: dict["iconImage"]!)
        cell.nameLab.text        = dict["name"]!
        cell.contentLab.text     = dict["content"]!
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

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
