

import UIKit

class ContentInfoBgView: UIView {
    
    let tableView = UITableView.init()
    let nameLab = UILabel.init()
    
    var backBlock: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        let nameLab = UILabel.init()
        nameLab.text = "影视档案"
        nameLab.textColor = CB_titleLabTextColor
        nameLab.font = UIFont.boldSystemFont(ofSize: 16)
        self.addSubview(nameLab)
        nameLab.snp_makeConstraints { (m) in
            m.centerX.equalToSuperview()
            m.top.equalToSuperview().offset(12)
            m.height.equalTo(20)
        }
        
        let backBtn = UIButton.init(type: .custom)
        backBtn.backgroundColor = .red
        backBtn.addTarget(self, action: #selector(backBtnCkick), for: .touchUpInside)
        self.addSubview(backBtn)
        backBtn.snp_makeConstraints { (m) in
            m.right.equalToSuperview()
            m.top.equalToSuperview()
            m.width.height.equalTo(44)
        }
        
//        nameLab.text = "中国机长"
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.rowHeight  = UITableView.automaticDimension
        tableView.register(ActorAndContentInfoTableViewCell.self, forCellReuseIdentifier: "ActorAndContentInfoTableViewCell")
        self.addSubview(tableView)
        tableView.snp_makeConstraints { (m) in
            m.top.equalTo(backBtn.snp_bottom).offset(0)
            m.left.right.equalToSuperview()
            m.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func backBtnCkick() {
        guard backBlock != nil else {
            return
        }
        backBlock!()
    }
    
}


extension ContentInfoBgView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActorAndContentInfoTableViewCell", for: indexPath) as! ActorAndContentInfoTableViewCell
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
