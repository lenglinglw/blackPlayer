//
//  Config.swift
//  ycmv
//
//  Created by 苏强 on 2019/9/21.
//  Copyright © 2019 QLYY. All rights reserved.
//

import Foundation
@_exported import SnapKit

let kAppWidth  = UIScreen.main.bounds.width
let kAppHeight = UIScreen.main.bounds.height


func isIPhonex() -> Bool {
    return UIApplication.shared.statusBarFrame.height > 20 ? true : false
}

let tabBarHeight = CGFloat(isIPhonex() ? 34 + 49 : 49)

let navHeight    = CGFloat(isIPhonex() ? 44: 20)
/*状态栏和导航栏总高度*/
let kNavBarAndStatusBarHeight = CGFloat(isIPhonex() ? 88.0 : 64.0)

/// 系统字体大小
public func CB_titleFont() -> UIFont {
    if isPads() {
        return UIFont.systemFont(ofSize: 18)
    } else {
        return UIFont.systemFont(ofSize: 16)
    }
    
}

public func CB_contentFont() -> UIFont {
    if isPads() {
        return UIFont.systemFont(ofSize: 16)
    } else {
        return UIFont.systemFont(ofSize: 14)
    }
}

/// 颜色
let CB_titleLabColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
let CB_viewBgColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
let CB_titleLabTextColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
let CB_lightGaryTitleLabColor = #colorLiteral(red: 0.7725490196, green: 0.7647058824, blue: 0.7647058824, alpha: 1)
let CB_ChooseLabColor = #colorLiteral(red: 0.1333333333, green: 0.6549019608, blue: 0.7294117647, alpha: 1)
let CB_lightGaryBgViewColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
let CB_BtnBgColor = #colorLiteral(red: 0.2156862745, green: 0.231372549, blue: 0.2470588235, alpha: 1)
/// 手机型号

public func isPads() -> Bool {
    let device = UIDevice.current.model
    if device == "iPod touch" {
        return true
    }
    if device == "iPad" {
        return true
    } else if device == "iPhone" {
        return false
    }
    return false
}

///
//public func YY_DEBUG_LOG(_ format: String) {
//    BuglyLog.level(.debug, logs: format)
//    print("debug: \(format)")
//}
//
/////
//public func YY_WARN_LOG(_ format: String) {
//    BuglyLog.level(.warn, logs: format)
//    print("warn: \(format)")
//}
//
/////
//public func YY_ERROR_LOG(_ format: String) {
//    BuglyLog.level(.error, logs: format)
//    print("error: \(format)")
//}
//
/////
//public func YY_INFO_LOG(_ format: String) {
//    BuglyLog.level(.info, logs: format)
//    print("info: \(format)")
//}

