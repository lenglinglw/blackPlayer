//
//  BaseNavigationViewController.swift
//  ycmv
//
//  Created by 苏强 on 2019/9/20.
//  Copyright © 2019 QLYY. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBgImage()
    }
    
    func setNavBgImage() {
        self.navigationBar.isTranslucent = false
        self.navigationBar.barStyle = .black
//        let image = UIImage.init(named: "nav_bg_image")
        let shadowImage = UIImage.init()
//        self.navigationBar.setBackgroundImage(image, for: .any, barMetrics: .default)
        self.navigationBar.barTintColor = #colorLiteral(red: 0.3882352941, green: 0.4117647059, blue: 0.9647058824, alpha: 1)
        self.navigationBar.shadowImage = shadowImage
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
    

}
