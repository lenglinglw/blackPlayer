//
//  HomeMainViewController.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/2.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class HomeMainViewController: WMPageController {
    let arr = ["精选", "电影", "网络电视", "纪录片", "综艺", "高清", "动漫", "少儿"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNav()
        menuView!.backgroundColor = .clear
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        set()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setNav() {

        self.navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .done, target: nil, action: nil)
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0, y: 0, width: 25, height: 44)
        menuBtn.setImage(UIImage(named: "home_menu"), for: .normal)
//        menuBtn.addTarget(self, action: #selector(addFollowAction(_:)), for: .touchUpInside)
        //    weakSelf.menuView.rightView = menuBtn;
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: menuBtn)
    }

    private func set() {
        showOnNavigationBar = true
        menuViewStyle = .line
        titleSizeNormal = 15.0
        titleSizeSelected = 18.0
        progressColor = CB_ChooseLabColor
        titleColorSelected = .white
        titleColorNormal = .white
        automaticallyCalculatesItemWidths = true
        progressViewIsNaughty = true
        progressWidth = 10
        progressViewBottomSpace = 5
    }
    
    override func numbersOfChildControllers(in pageController: WMPageController) -> Int {
        return arr.count
    }
    
    override func pageController(_ pageController: WMPageController, titleAt index: Int) -> String {
        return arr[index]
    }
    
    override func pageController(_ pageController: WMPageController, viewControllerAt index: Int) -> UIViewController {
//        SystemHomeViewController * homeVc = [[SystemHomeViewController alloc] init];
//        return homeVc;
        if index == 0 {
            let vc = HomeMovieViewController.init()
            
            return vc
        } else if index == 1{
            let vc = HomeMovieViewController.init() //#A1CCD0
            
            return vc
        } else if index == 2 {
            let vc = HomeMovieViewController.init()
            return vc
        } else {
            let vc = HomeMovieViewController.init()
            
            return vc
        }
        
        
    }
    // 每个menuView的宽度
    override func menuView(_ menu: WMMenuView!, widthForItemAt index: Int) -> CGFloat {
        return super.menuView(menu, widthForItemAt: index) + 20
    }

    override func pageController(_ pageController: WMPageController, preferredFrameFor menuView: WMMenuView) -> CGRect {
        return CGRect(x: 16, y: 0, width: kAppWidth - 32, height: 44)
    }
    
    override func pageController(_ pageController: WMPageController, preferredFrameForContentView contentView: WMScrollView) -> CGRect {
//        let originY = self.pageController(pageController, preferredFrameFor: self.menuView!).maxY
        return CGRect(x: 0, y: 0, width: kAppWidth, height: kAppHeight)
    }
    
    override func pageController(_ pageController: WMPageController, willEnter viewController: UIViewController, withInfo info: [AnyHashable : Any]) {
        print((info))
        
        if info["index"] as! Int == 0 {
            print(info["title"])
        } else if info["index"] as! Int == 1 {
            let vc = viewController as! HomeMovieViewController
            vc.bgImageView.image = ZFUtilities.image(with: #colorLiteral(red: 0.3882352941, green: 0.4117647059, blue: 0.9647058824, alpha: 1), size: CGSize(width: 1, height: 1))
            self.navigationController?.navigationBar.setBackgroundImage(vc.bgImageView.image, for: .default)
//            self.tabBarController?.tabBar.backgroundImage = vc.bgImageView.image
        } else if info["index"] as! Int == 2 {
            let vc = viewController as! HomeMovieViewController
            vc.bgImageView.image = ZFUtilities.image(with: #colorLiteral(red: 0.1411764706, green: 0.1725490196, blue: 0.2274509804, alpha: 1), size: CGSize(width: 1, height: 1))
            self.navigationController?.navigationBar.setBackgroundImage(vc.bgImageView.image, for: .default)
//            self.tabBarController?.tabBar.backgroundImage = vc.bgImageView.image
        }
        
    }
    
}
