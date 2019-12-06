//
//  CustomTabBar.swift
//  ycmv
//
//  Created by 苏强 on 2019/9/20.
//  Copyright © 2019 QLYY. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {
    
    lazy var centerBtn: UIButton = {
        let centerBtn = UIButton.init(type: .custom)
        centerBtn.frame = CGRect(x: 0, y: 0, width: 66, height: 44)
        centerBtn.setImage(UIImage.init(named: "tabbar_add"), for: .normal)
        centerBtn.addTarget(self, action: #selector(centerBtnClick(_:)), for: .touchUpInside)
        return centerBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(centerBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var tabbarBtnArr: Array<UIView> = []
        for view in subviews {
            if (view.isKind(of: NSClassFromString("UITabBarButton")!) ) {
                tabbarBtnArr.append(view)
            }
        }
        let barWidth = self.bounds.width
        let barHeight = self.bounds.height
        let centerBtnWidth = centerBtn.frame.width
        let centerBtnHeight = centerBtn.frame.height
        // 设置中间按钮的位置，居中，凸起一丢丢
        if isIPhonex() {
            centerBtn.center = CGPoint(x: barWidth / 2, y: barHeight - centerBtnHeight / 2 - 40)
        } else {
            centerBtn.center = CGPoint(x: barWidth / 2, y: barHeight - centerBtnHeight / 2 - 5)
        }
        
        // 重新布局其他tabBarItem
        // 平均分配其他tabBarItem的宽度
        let barItemWidth = (barWidth - centerBtnWidth) / CGFloat(tabbarBtnArr.count)
        // 逐个布局tabBarItem，修改UITabBarButton的frame
        for (index, value) in tabbarBtnArr.enumerated() {
            var frame = value.frame
            if index >= tabbarBtnArr.count / 2 {
                // 重新设置x坐标，如果排在中间按钮的右边需要加上中间按钮的宽度
                frame.origin.x = CGFloat(index) * barItemWidth + centerBtnWidth
            } else {
                frame.origin.x = CGFloat(index) * barItemWidth
            }
            // 重新设置宽度
            frame.size.width = barItemWidth
            value.frame = frame
        }
//        tabbarBtnArr.enumerateObjects({ view, idx, stop in
//
//
//        })
        // 把中间按钮带到视图最前面
        bringSubviewToFront(centerBtn)

    }
    
    @objc func centerBtnClick(_ sender: UIButton) {
        print("11111111")
    }
}
