//
//  HomeMoviesMySelfTableViewCell.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/4.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class HomeMoviesMySelfTableViewCell: UITableViewCell {

    let nameLab = UILabel.init()
    let contentLab = UILabel.init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let lab = UILabel.init()
        lab.text = "你的专属影院"
        lab.font = UIFont.boldSystemFont(ofSize: 16)
        lab.textColor = .white
        self.addSubview(lab)
        lab.snp_makeConstraints { (m) in
            m.top.equalToSuperview().offset(16)
            m.left.equalToSuperview().offset(16)
            m.height.equalTo(20)
        }
        createCycleScrollView()
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
             m.top.equalToSuperview().offset(52)
             m.left.right.equalToSuperview()
             m.height.equalTo(200)
             m.bottom.equalToSuperview().offset(-8)
         }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeMoviesMySelfTableViewCell: TYCyclePagerViewDataSource, TYCyclePagerViewDelegate {
    
    func numberOfItems(in pageView: TYCyclePagerView) -> Int {
        return 3
    }
    
    func pagerView(_ pagerView: TYCyclePagerView, cellForItemAt index: Int) -> UICollectionViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", for: index) as! CyclePagerTableViewCell
        return cell
    }
    
    func layout(for pageView: TYCyclePagerView) -> TYCyclePagerViewLayout {
        let layout = TYCyclePagerViewLayout.init()
        layout.itemSize = CGSize(width: 150, height: 200)
        layout.itemSpacing = 0
        layout.layoutType = .linear
        return layout
    }
    
}
