//
//  HomeRecommendTableViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/4.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class HomeRecommendTableViewCell: UITableViewCell {
    
    lazy var dataArr: [Dictionary<String,String>] = {
        var dataArr = Array<Dictionary<String, String>>()
        dataArr = [["iconImage":"home_recommand_01", "name": "庆余年", "content": "豪华阵容齐上阵"],
                   ["iconImage":"home_recommand_02", "name": "奇葩说  第六季","content": "陈铭回归支援薛兆丰战队"],
                   ["iconImage":"home_recommand_02", "name": "庆余年", "content": "豪华阵容齐上阵"],
                   ["iconImage":"home_recommand_01", "name": "奇葩说  第六季","content": "陈铭回归支援薛兆丰战队"]]
        return dataArr
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        let lab = UILabel()
        lab.text = "热门推荐"
        lab.font = CB_titleFont()
        lab.textColor = CB_titleLabTextColor
        self.addSubview(lab)
        lab.snp_makeConstraints { (m) in
            m.top.equalToSuperview().offset(8)
            m.left.equalToSuperview().offset(8)
            m.height.equalTo(20)
        }
        
        let btn = UIButton.init(type: .custom)
        self.addSubview(btn)
        btn.snp_makeConstraints { (m) in
            m.right.equalToSuperview().offset(-8)
            m.top.equalToSuperview()
            m.height.equalTo(36)
            m.width.equalTo(100)
        }
        
        
        
        let flowLayout = UICollectionViewFlowLayout()
        //设置cell尺寸
        flowLayout.itemSize = CGSize(width: (kAppWidth - 24) / 2, height: (kAppWidth - 24) / 2 * 0.65 + 28 + 28)
        //设置滑动方向
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        //创建UICollectView对象
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kAppWidth, height: 70), collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeRecommendCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "HomeRecommendCollectionViewCell")
        self.addSubview(collectionView)
        collectionView.snp_makeConstraints { (m) in
            m.top.equalTo(lab.snp_bottom).offset(8)
            m.left.right.bottom.equalToSuperview()
            m.height.equalTo(((kAppWidth - 24) / 2 * 0.65 + 30 + 30) * 2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeRecommendTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeRecommendCollectionViewCell", for: indexPath) as! HomeRecommendCollectionViewCell
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
