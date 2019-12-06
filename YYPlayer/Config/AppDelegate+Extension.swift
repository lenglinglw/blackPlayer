//
//  AppDelegate+Extension.swift
//  YingYiMind
//
//  Created by 苏强 on 2019/11/10.
//  Copyright © 2019 qlyy. All rights reserved.
//

import Foundation

let JPUSH_APP_KEY = "b064e129fc90b062fd405373"
let JPUSH_CHANNEL = "APP_STORE"
let JPUSH_APS     = false // true false

//extension AppDelegate: JPUSHRegisterDelegate {
//
//    func initJPush(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
//
//        let entity = JPUSHRegisterEntity.init()
//
//        if #available(iOS 12.0, *) {
//
//            entity.types = Int(JPAuthorizationOptions.alert.rawValue | JPAuthorizationOptions.badge.rawValue | JPAuthorizationOptions.sound.rawValue | JPAuthorizationOptions.providesAppNotificationSettings.rawValue)
//
//        } else {
//
//            entity.types = Int(JPAuthorizationOptions.alert.rawValue | JPAuthorizationOptions.badge.rawValue | JPAuthorizationOptions.sound.rawValue)
//
//        }
//
//        JPUSHService.register(forRemoteNotificationConfig: entity, delegate: self)
//        JPUSHService.setup(withOption: launchOptions, appKey: JPUSH_APP_KEY, channel: JPUSH_CHANNEL, apsForProduction: JPUSH_APS, advertisingIdentifier: nil)
//
//    }
//
//    @available(iOS 10.0, *)
//    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, willPresent notification: UNNotification!, withCompletionHandler completionHandler: ((Int) -> Void)!) {
//
//    }
//
//    @available(iOS 10.0, *)
//    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, didReceive response: UNNotificationResponse!, withCompletionHandler completionHandler: (() -> Void)!) {
//
//    }
//
//    @available(iOS 10.0, *)
//    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, openSettingsFor notification: UNNotification!) {
//
//    }
//
//}

/// im
//extension AppDelegate {
//
//    func initIM(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
//        // Required - 启动 JMessage SDK
//        JMessage.setupJMessage(launchOptions, appKey: JPUSH_APP_KEY, channel: JPUSH_CHANNEL, apsForProduction: JPUSH_APS, category: nil, messageRoaming: true)
//        JMessage.add(self, with: nil)
////        JMessage.setLogOFF()
//        // Required - 注册 APNs 通知
//        if Float(UIDevice.current.systemVersion) ?? 0.0 >= 8.0 {
//            //可以添加自定义categories
//            JMessage.register(forRemoteNotificationTypes: UIUserNotificationType.badge.rawValue |
//            UIUserNotificationType.sound.rawValue |
//            UIUserNotificationType.alert.rawValue, categories: nil)
//        } else {
//
//        }
//
//    }
//}
//extension AppDelegate: JMessageDelegate {
//    func onReceive(_ event: JMSGUserLoginStatusChangeEvent!) {
//        switch event.eventType.rawValue {
//        case JMSGLoginStatusChangeEventType.eventNotificationLoginKicked.rawValue,
//             JMSGLoginStatusChangeEventType.eventNotificationServerAlterPassword.rawValue,
//             JMSGLoginStatusChangeEventType.eventNotificationUserLoginStatusUnexpected.rawValue:
//            _logout()
//        default:
//            break
//        }
//    }
//
//    func _logout() {
//        JCVerificationInfoDB.shareInstance.queue = nil
//        UserDefaults.standard.removeObject(forKey: kCurrentUserName)
//        let alertView = UIAlertView(title: "您的账号在其它设备上登录", message: "", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "重新登录")
//        alertView.show()
//    }
//
//}

//extension AppDelegate: UIAlertViewDelegate {
//
//    private func pushToLoginView() {
//        UserDefaults.standard.removeObject(forKey: kCurrentUserPassword)
//        if let appDelegate = UIApplication.shared.delegate,
//            let window = appDelegate.window {
//            window?.rootViewController = BaseNavigationViewController(rootViewController: LoginViewController())
//        }
//    }
//
//    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
//        if buttonIndex == 1 {
//            guard let username = UserDefaults.standard.object(forKey: kLastUserName) as? String  else {
//                pushToLoginView()
//                return
//            }
//            guard let password = UserDefaults.standard.object(forKey: kCurrentUserPassword) as? String else {
//                pushToLoginView()
//                return
//            }
//            MBProgressHUD_JChat.showMessage(message: "登录中", toView: nil)
//            JMSGUser.login(withUsername: username, password: password) { (result, error) in
//                MBProgressHUD_JChat.hide(forView: nil, animated: true)
//                if error == nil {
//                    UserDefaults.standard.set(username, forKey: kLastUserName)
//                    UserDefaults.standard.set(username, forKey: kCurrentUserName)
//                    UserDefaults.standard.set(password, forKey: kCurrentUserPassword)
//                } else {
//                    self.pushToLoginView()
//                    MBProgressHUD_JChat.show(text: "\(String.errorAlert(error! as NSError))", view: self.window?.rootViewController?.view, 2)
//                }
//            }
//        } else {
//            pushToLoginView()
//        }
//    }
//
//}

//extension AppDelegate:BMKGeneralDelegate {
//    func onGetPermissionState(_ iError: Int32) {
//        if 0 == iError {
//            NSLog("授权成功")
//        } else {
//            NSLog("授权失败：%d", iError)
//        }
//    }
//}




/// 微信
extension AppDelegate: WXApiDelegate {
    
    func initWxApi() {
        WXApi.registerApp("", universalLink: "")
    }
    
    func delegateWXApi(_ url: URL, delegate: AppDelegate) -> Bool {
        
        return WXApi.handleOpen(url, delegate: delegate)
        
    }
    
    func onReq(_ req: BaseReq) {
        
    }
    
//    func onResp(_ resp: BaseResp) {
//        if type(of: resp) === SendAuthResp.self {
//            dealWXLogin(resp as! SendAuthResp)
//        } else if type(of: resp) === SendMessageToWXResp.self{
//            dealWXShare(resp as! SendMessageToWXResp)
//        }
//    }
    
}

/// 支付宝支付
extension AppDelegate {
    func intiAliPay(_ url: URL) {
        AlipaySDK.defaultService()?.processAuthResult(url, standbyCallback: { (dict) in
            
        })
    }
}


/// orther
let BUGLYAPPID = ""
extension AppDelegate {
    func initOrther() {
        Bugly.start(withAppId: BUGLYAPPID)
        ShareSDK.registPlatforms { (register) in
            register?.setupQQ(withAppId: "", appkey: "")
            register?.setupWeChat(withAppId: "", appSecret: "", universalLink: "")
        }
    }
    
//    func registerDeviceToken(_ deviceToken: Data) {
//        JPUSHService.registerDeviceToken(deviceToken)
//        JMessage.registerDeviceToken(deviceToken)
//    }
}

public protocol SelfAware: class {
    static func awake()
}
