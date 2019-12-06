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
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.rowHeight  = UITableView.automaticDimension
        tableView.register(MySelfHeaderTableViewCell.self, forCellReuseIdentifier: "MySelfHeaderTableViewCell")
        tableView.register(MySelfBtnTableViewCell.self, forCellReuseIdentifier: "MySelfBtnTableViewCell")
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySelfHeaderTableViewCell", for: indexPath) as! MySelfHeaderTableViewCell
            cell.backgroundColor = .clear
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySelfBtnTableViewCell", for: indexPath) as! MySelfBtnTableViewCell
            cell.backgroundColor = .clear
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMoviesMySelfTableViewCell", for: indexPath) as! HomeMoviesMySelfTableViewCell
            cell.backgroundColor = .clear
            return cell
        }
        
    }
    
}
