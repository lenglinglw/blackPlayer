//
//  MySelfBtnTableViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/4.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class MySelfBtnTableViewCell: UITableViewCell {

    lazy var dataArr: [Dictionary<String,String>] = {
        var dataArr = Array<Dictionary<String, String>>()
        dataArr = [["iconImage":"my_self_collect", "title": "我的收藏"],
                   ["iconImage":"my_self_history", "title": "历史记录"],
                   ["iconImage":"my_self_cache", "title": "我的缓存"],
                   ["iconImage":"my_self_bind", "title": "绑定手机"],
                   ["iconImage":"my_self_feedback", "title": "意见反馈"],
                   ["iconImage":"my_self_set", "title": "用户设置"]]
        return dataArr
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let flowLayout = UICollectionViewFlowLayout()
        //设置cell尺寸
        flowLayout.itemSize = CGSize(width: kAppWidth/3, height: kAppWidth / 3 * 0.8)
        //设置滑动方向
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        //创建UICollectView对象
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kAppWidth, height: 0), collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        //创建重用cell（集合对象是代码生成的而不是NIB或故事板生成的因此需要注册一个UICollectionCell，否则初始化时会发生错误）
        collectionView.register(MySelfCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "MySelfCollectionViewCell")
        self.addSubview(collectionView)
        collectionView.snp_makeConstraints { (m) in
            m.edges.equalToSuperview()
            m.height.equalTo(kAppWidth * 0.8 * 2/3 + 10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MySelfBtnTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 6
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MySelfCollectionViewCell", for: indexPath) as! MySelfCollectionViewCell
        let dict = dataArr[indexPath.row]
        cell.backgroundColor = .white
        cell.iconImageView.image = UIImage(named: dict["iconImage"]!)
        cell.titleLab.text       = dict["title"]!
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    //每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    //最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // 最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
