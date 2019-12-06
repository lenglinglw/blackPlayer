//
//  HomeMovieMoviesTableViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/3.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class HomeMovieMoviesTableViewCell: UITableViewCell {

    let lab = UILabel()
    
    
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
        selectionStyle = .none
        lab.text = "最新电影"
        lab.font = CB_titleFont()
        lab.textColor = CB_titleLabTextColor
        self.addSubview(lab)
        lab.snp_makeConstraints { (m) in
            m.top.equalToSuperview().offset(8)
            m.left.equalToSuperview().offset(8)
        }
        let flowLayout = UICollectionViewFlowLayout()
        //设置cell尺寸
        flowLayout.itemSize = CGSize(width: (kAppWidth - 24) / 3, height: ((kAppWidth - 24) / 3 * 1.2  + 28 + 28))
        //设置滑动方向
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        //创建UICollectView对象
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kAppWidth, height: ((kAppWidth - 24) / 3 * 1.2  + 28 + 28) * 3 + 16), collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        //创建重用cell（集合对象是代码生成的而不是NIB或故事板生成的因此需要注册一个UICollectionCell，否则初始化时会发生错误）
        collectionView.register(HomeMovieMoviesCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "HomeMovieMoviesCollectionViewCell")
        self.addSubview(collectionView)
        collectionView.snp_makeConstraints { (m) in
            m.top.equalTo(lab.snp_bottom).offset(8)
            m.left.right.equalToSuperview()
            m.height.equalTo(((kAppWidth - 24) / 3 * 1.2  + 28 + 28) * 2 + 32)
            m.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeMovieMoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 6
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeMovieMoviesCollectionViewCell", for: indexPath) as! HomeMovieMoviesCollectionViewCell
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
        return 4
    }

    // 最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
