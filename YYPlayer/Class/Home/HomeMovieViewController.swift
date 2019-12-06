//
//  HomeMovieViewController.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/2.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class HomeMovieViewController: BaseViewController {
    
    let bgImageView = UIImageView.init()
    let tableView   = UITableView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        view.addSubview(bgImageView)
        bgImageView.snp_makeConstraints { (m) in
            m.edges.equalToSuperview()
        }
        drawUI()
    }
    
    private func drawUI() {
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.rowHeight  = UITableView.automaticDimension
        tableView.register(HomeMovieCycleTableViewCell.self, forCellReuseIdentifier: "HomeMovieCycleTableViewCell")
        tableView.register(HomeMovieTypeTableViewCell.self, forCellReuseIdentifier: "HomeMovieTypeTableViewCell")
        tableView.register(HomeRecommendTableViewCell.self, forCellReuseIdentifier: "HomeRecommendTableViewCell")
        tableView.register(HomeMovieMoviesTableViewCell.self, forCellReuseIdentifier: "HomeMovieMoviesTableViewCell")
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


    
extension HomeMovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMovieCycleTableViewCell", for: indexPath) as! HomeMovieCycleTableViewCell
            cell.vc = self
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMovieTypeTableViewCell", for: indexPath) as! HomeMovieTypeTableViewCell
            cell.backgroundColor = .white
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeRecommendTableViewCell", for: indexPath) as! HomeRecommendTableViewCell
            cell.backgroundColor = .white
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMovieMoviesTableViewCell", for: indexPath) as! HomeMovieMoviesTableViewCell
            cell.backgroundColor = .white
            return cell
        }
        
    }
    
}

