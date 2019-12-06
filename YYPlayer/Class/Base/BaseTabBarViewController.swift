//
//  BaseTabBarViewController.swift
//  ycmv
//
//  Created by 苏强 on 2019/9/20.
//  Copyright © 2019 QLYY. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    let tabbarItemBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setValue(CustomTabBar.init(), forKeyPath: "tabBar")
        self.tabBar.backgroundImage = UIImage.init(named: "nav_bg_image")
        addAllChildViewController()
    }
    
    private func addAllChildViewController() {
        let controllerArr = [HomeMovieViewController.init(),VIPViewController.init(),FoundMovieViewController.init(),MySelfViewController.init()]
        let titleArr = ["首页","vip","海淘","我的"]
        let imageArr = ["tabbar_home","tabbar_vip","tabbar_found","tabbar_my_self"];
        var items:Array<BaseNavigationViewController> = []
        for (index, value) in controllerArr.enumerated() {
            let nav = BaseNavigationViewController.init(rootViewController: value)
            nav.tabBarItem.title = titleArr[index]
            nav.tabBarItem.image = UIImage.init(named: imageArr[index])?.withRenderingMode(.alwaysOriginal)
            nav.tabBarItem.selectedImage = UIImage.init(named: imageArr[index] + "_selected")?.withRenderingMode(.alwaysOriginal)
            nav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3882352941, green: 0.4117647059, blue: 0.9647058824, alpha: 1)], for: .selected)
            items.append(nav)
            
        }
        self.viewControllers = items
        
    }
    
    private func addAllChildViewController(vc: UIViewController, title: String, image: String, selectedImage: String) {
        let nav = BaseNavigationViewController.init(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage.init(named: image)
        nav.tabBarItem.selectedImage = UIImage.init(named: selectedImage)
        self.addChild(nav)
    }

}
