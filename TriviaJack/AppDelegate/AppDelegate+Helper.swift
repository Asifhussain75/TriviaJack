//
//  AppDelegate+Helper.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 15/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit

extension AppDelegate {
    func setupNavigationBarAppearence(){
        // changes background color.
        UINavigationBar.appearance().barTintColor = Constants.Color.appDefaultBlue
        UINavigationBar.appearance().tintColor = UIColor.clear
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17) , NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    func gotoMyScreen() {
        //        if kUserDefaults.isUserLogin() {
        //                 //switchToHome()
        //        } else {
        //            switchOnboarding()
        //        }
        switchLoginScreen()
    }
    func switchLoginScreen() {
        let vc = TJLoginVC.instantiate(fromAppStoryboard: .registration)
        let nc = SwipeableNavigationController(rootViewController: vc)
        nc.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = nil
        window?.rootViewController = nc
    }
    func setSwipe(enabled: Bool, navigationController: UINavigationController?){
        if let nav = navigationController as? SwipeableNavigationController {
            nav.isSwipeEnabled = enabled
        }
    }
    func setupTabBarAppearence(){
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: Constants.FontName.stawixMedium, size: 10) as Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: Constants.FontName.stawixBold, size: 10) as Any], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Constants.Color.appDefaultLightGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Constants.Color.appDefaultWhite], for: .selected)
        UITabBar.appearance().layer.borderWidth = 0.0
    }
    func setuUUID() {
        if Constants.userDefaults.value(forKey: UserDefaultKeys.uuid) == nil {
            let deviceId = NSUUID().uuidString
            Constants.userDefaults.set(deviceId, forKey: UserDefaultKeys.uuid)
        }
    }
    func getUUId() -> String {
        return Constants.userDefaults.string(forKey: UserDefaultKeys.uuid) ?? "Device id not found"
    }
}

