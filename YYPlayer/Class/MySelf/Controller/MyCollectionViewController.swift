//
//  MyCollectionViewController.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/6.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class MyCollectionViewController: BaseViewController {

    let tableView   = UITableView.init()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        drawUI()
        self.title = "我的收藏"
    }
    
    private func drawUI() {
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.rowHeight  = UITableView.automaticDimension
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "HistoryTableViewCell")
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (m) in
            m.top.equalToSuperview().offset(0)
            m.left.right.equalToSuperview()
            if #available(iOS 11.0, *) {
                m.bottom.equalTo(view.safeAreaLayoutGuide)
            } else {
                m.bottom.equalToSuperview()
            }
        }
    }
}

extension MyCollectionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init()
        view.backgroundColor = .black
        let lab = UILabel()
        lab.text = "今天"
        lab.textColor = .white
        view.addSubview(lab)
        lab.snp_makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.top.equalToSuperview().offset(16)
            m.left.equalToSuperview().offset(16)
        }
        return view
        
    }
}
