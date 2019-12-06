//
//  PlayerViewController.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/2.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit
import SnapKit
class PlayerViewController: UIViewController {

    var playView: ZFPlayerController! = nil
    let controlView = ZFPlayerControlView.init()
    let bgView = UIView.init()
    let tableView   = UITableView.init()
    var num = 10
    let moreInfoView = ContentInfoBgView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        drawPlayerView()
        drawUI()
        createMoreInfoView()
    }
    
    private func drawPlayerView() {
        let playManager = ZFAVPlayerManager.init()
        bgView.backgroundColor = .black
        view.addSubview(bgView)
        bgView.snp_makeConstraints { (m) in
            m.top.left.right.equalToSuperview()
            m.height.equalTo(200)
        }
        playView = ZFPlayerController.init(playerManager: playManager, containerView: bgView)
        playView.controlView = controlView
        playView.assetURL = URL.init(string: "https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4")!
    }
    
    private func drawUI() {
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.rowHeight  = UITableView.automaticDimension
        tableView.register(ContentInfoTableViewCell.self, forCellReuseIdentifier: "ContentInfoTableViewCell")
        tableView.register(PlayerChatTableViewCell.self, forCellReuseIdentifier: "PlayerChatTableViewCell")
        tableView.register(DramaSeriesTableViewCell.self, forCellReuseIdentifier: "DramaSeriesTableViewCell")
        tableView.register(HomeMovieMoviesTableViewCell.self, forCellReuseIdentifier: "HomeMovieMoviesTableViewCell")
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (m) in
            
            m.top.equalTo(bgView.snp_bottom).offset(0)
            m.left.right.equalToSuperview()
            if #available(iOS 11.0, *) {
                m.bottom.equalTo(view.safeAreaLayoutGuide)
            } else {
                m.bottom.equalToSuperview()
            }
        }
    }
    
    private func createMoreInfoView() {
        
        moreInfoView.backBlock = { [weak self] () in
            guard let self = self else {
                return
            }
            UIView.animate(withDuration: 0.5, animations: {
                self.moreInfoView.frame = CGRect(x: 0, y: kAppHeight, width: kAppWidth, height: kAppHeight - 200)
                self.moreInfoView.alpha = 0.0
            }) { (t) in
                self.moreInfoView.removeFromSuperview()
            }
            
        }
    }
    
    @objc func btnClick(_ sender: UIButton) {
        
    }
    
}

extension PlayerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContentInfoTableViewCell", for: indexPath) as! ContentInfoTableViewCell
            
            cell.block = { [weak self] () in
                print("1111")
                guard let self = self else {
                    return
                }
                self.view.addSubview(self.moreInfoView)
                self.moreInfoView.frame = CGRect(x: 0, y: kAppHeight, width: kAppWidth, height: kAppHeight - 200)
                self.moreInfoView.alpha = 0.0
                UIView.animate(withDuration: 0.5, animations: {
                    self.moreInfoView.frame = CGRect(x: 0, y: 200, width: kAppWidth, height: kAppHeight - 200)
                    self.moreInfoView.alpha = 1.0
                }) { (t) in
                    
                }
                
            }
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMovieMoviesTableViewCell", for: indexPath) as! HomeMovieMoviesTableViewCell
            cell.backgroundColor = .white
            return cell
        }  else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DramaSeriesTableViewCell", for: indexPath) as! DramaSeriesTableViewCell
            cell.backgroundColor = .white
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerChatTableViewCell", for: indexPath) as! PlayerChatTableViewCell
            cell.backgroundColor = .white
            return cell
        }
        
    }
    
}

