//
//  BaseViewController.swift
//  ycmv
//
//  Created by 苏强 on 2019/9/24.
//  Copyright © 2019 QLYY. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        setBackBtn()
        
    }
    func setBackBtn() {
//        YY_INFO_LOG("self.navigationController?.viewControllers.count")
        if self.navigationController?.viewControllers.count == 1 {
            
        } else {
            let backBtn = UIButton.init(type: .custom)
            backBtn.setImage(UIImage.init(named: "icon_back"), for: .normal)
            if #available(iOS 11.0, *) {
                backBtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 11, bottom: 0, right: 10)
            } else {
                backBtn.contentHorizontalAlignment = .left
            }
            backBtn.addTarget(self, action: #selector(popVC), for: .touchUpInside)
            let backItem =  UIBarButtonItem.init(customView: backBtn)
            self.navigationItem.leftBarButtonItem = backItem
        }
        navigationItem.hidesBackButton = true
        
    }
    
    @objc func popVC() {
        self.navigationController!.popViewController(animated: true)
    }
}
