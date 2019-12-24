//
//  HomeMovieCycleTableViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/3.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class HomeMovieCycleTableViewCell: UITableViewCell {
    
    weak var vc: UIViewController!
    
    lazy var dataArr: [String] = {
        var dataArr = Array<String>()
        dataArr = ["ceshi_cycle_01","ceshi_cycle_02","ceshi_cycle_03"]
        return dataArr
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        let bgImageView = UIImageView.init()
        self.addSubview(bgImageView)
        bgImageView.image = ZFUtilities.image(with: #colorLiteral(red: 0.3882352941, green: 0.4117647059, blue: 0.9647058824, alpha: 1), size: CGSize(width: 1, height: 1))
        bgImageView.snp_makeConstraints { (m) in
            m.top.left.right.equalToSuperview()
            m.height.equalTo(100)
        }
        createCycleScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCycleScrollView() {
        let cycleView = TYCyclePagerView.init()
        cycleView.isInfiniteLoop = true
        cycleView.autoScrollInterval = 0
        cycleView.dataSource = self
        cycleView.delegate = self
        cycleView.register(CyclePagerTableViewCell.self, forCellWithReuseIdentifier: "cell")
        self.addSubview(cycleView)
        cycleView.snp_makeConstraints { (m) in
            m.top.equalToSuperview().offset(0)
            m.left.equalToSuperview().offset(0)
            m.right.equalToSuperview().offset(0)
            m.height.equalTo(160)
            m.bottom.equalToSuperview().offset(0)
        }
   }
}

extension HomeMovieCycleTableViewCell: TYCyclePagerViewDataSource, TYCyclePagerViewDelegate {
    
    func numberOfItems(in pageView: TYCyclePagerView) -> Int {
        return 3
    }
    
    func pagerView(_ pagerView: TYCyclePagerView, cellForItemAt index: Int) -> UICollectionViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", for: index) as! CyclePagerTableViewCell
        cell.headerImageView.image = UIImage(named: dataArr[index])
        return cell
    }
    
    func layout(for pageView: TYCyclePagerView) -> TYCyclePagerViewLayout {
        let layout = TYCyclePagerViewLayout.init()
        layout.itemSize = CGSize(width: kAppWidth, height: 160)
        layout.itemSpacing = 0
        layout.layoutType = .normal
        return layout
    }
    
    func pagerView(_ pageView: TYCyclePagerView, didSelectedItemCell cell: UICollectionViewCell, at index: Int) {
//        PlayerViewController
        guard vc != nil else {
            return
        }
        vc.navigationController?.pushViewController(PlayerViewController(), animated: true)
    }
    
}
