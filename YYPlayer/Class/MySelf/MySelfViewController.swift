//
//  MySelfViewController.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/4.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class MySelfViewController: BaseViewController {

    let tableView   = UITableView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawUI()
    }
    
    private func drawUI() {
        self.title = "个人中心"
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.rowHeight  = UITableView.automaticDimension
        tableView.register(MySelfHeaderTableViewCell.self, forCellReuseIdentifier: "MySelfHeaderTableViewCell")
        tableView.register(MySelfBtnTableViewCell.self, forCellReuseIdentifier: "MySelfBtnTableViewCell")
        tableView.register(HomeMoviesMySelfTableViewCell.self, forCellReuseIdentifier: "HomeMoviesMySelfTableViewCell")
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (m) in
            m.top.equalToSuperview()
            m.left.right.equalToSuperview()
            if #available(iOS 11.0, *) {
                m.bottom.equalTo(view.safeAreaLayoutGuide)
            } else {
                m.bottom.equalToSuperview()
            }
        }
    }
}

extension MySelfViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySelfHeaderTableViewCell", for: indexPath) as! MySelfHeaderTableViewCell
            return cell
        } else if indexPath.row == 1 {
            let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
            let bgView = UIView.init()
            bgView.backgroundColor = .white
            cell.contentView.addSubview(bgView)
            bgView.snp_makeConstraints { (m) in
                m.edges.equalToSuperview()
            }
            let vipLab = UILabel()
            vipLab.text = "vip:6"
            vipLab.textColor = CB_titleLabTextColor
            vipLab.font = CB_titleFont()
            bgView.addSubview(vipLab)
            vipLab.snp_makeConstraints { (m) in
                m.left.top.equalToSuperview().offset(16)
            }
            let timeLab = UILabel()
            timeLab.text = "2020.10.10"
            timeLab.textColor = CB_titleLabTextColor
            timeLab.font = CB_contentFont()
            bgView.addSubview(timeLab)
            timeLab.snp_makeConstraints { (m) in
                m.top.equalTo(vipLab.snp_bottom).offset(4)
                m.left.equalToSuperview().offset(16)
                m.bottom.equalToSuperview().offset(-16)
            }
            return cell
        }
        
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySelfBtnTableViewCell", for: indexPath) as! MySelfBtnTableViewCell
            cell.backgroundColor = .clear
            cell.vc = self
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMoviesMySelfTableViewCell", for: indexPath) as! HomeMoviesMySelfTableViewCell
            return cell
        }
        
    }
    
}
