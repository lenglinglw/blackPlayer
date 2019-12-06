//
//  Common.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/5.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

class Common: NSObject {
    
    let shared = Common()
    
    /// 时间戳转化
    func timeStampToDate(timeStamp: String) -> String {
        let timeSta:TimeInterval = TimeInterval.init(timeStamp)!
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日"
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }
    
}
