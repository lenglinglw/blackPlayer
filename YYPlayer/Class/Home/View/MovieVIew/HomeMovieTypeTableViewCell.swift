//
//  HomeMovieTypeTableViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/3.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class HomeMovieTypeTableViewCell: UITableViewCell {

    lazy var dataArr: [Dictionary<String,String>] = {
        var dataArr = Array<Dictionary<String, String>>()
        dataArr = [["iconImage":"home_movie", "title": "影视"],["iconImage":"home_entertainment", "title": "娱乐"],["iconImage":"home_information", "title": "资讯"],["iconImage":"home_derive", "title": "衍生"]]
        return dataArr
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        let flowLayout = UICollectionViewFlowLayout()
        //设置cell尺寸
        flowLayout.itemSize = CGSize(width: (kAppWidth) / 4, height: 70)
        //设置滑动方向
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        //创建UICollectView对象
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kAppWidth, height: 70), collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MySelfCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "MySelfCollectionViewCell")
        self.addSubview(collectionView)
        collectionView.snp_makeConstraints { (m) in
            m.top.left.right.bottom.equalToSuperview()
            m.height.equalTo(70)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeMovieTypeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MySelfCollectionViewCell", for: indexPath) as! MySelfCollectionViewCell
        let dict = dataArr[indexPath.row]
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
