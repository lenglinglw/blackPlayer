//
//  AppDelegate.swift
//  YYPlayer
//
//  Created by 苏强 on 2019/12/2.
//  Copyright © 2019 qlyy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window?.rootViewController = BaseTabBarViewController.init()
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        registerDeviceToken(deviceToken)
    }
    
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        if url.host == "safepay" {
//            intiAliPay(url)
//            return true
//        } else {
//            return delegateWXApi(url, delegate: self)
//        }
//    }
}

