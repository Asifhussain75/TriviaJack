//
//  AppDelegate.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 15/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var application: UIApplication?
    var appleHandler: AppleLoginManager?
    var fbHandler: FacebookLoginManager?
    var currentLoginType: LoginType = .normal
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        service = Network()
        fbHandler = FacebookLoginManager(application: application, launchOptions: launchOptions)
        appleHandler = AppleLoginManager()
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        setupNavigationBarAppearence()
        window?.makeKeyAndVisible()
        gotoMyScreen()
        UIFont.printFontFamily()
        return true
    }

    func setValueUserDefault(model: RegistrationModel?) {
        if let email = model?.user?.email {
            Constants.userDefaults.set(email, forKey: UserDefaultKeys.email)
        }
        Constants.userDefaults.set(true, forKey: UserDefaultKeys.kIsLoggedIn)
        if let access_token = model?.access_token {
            Constants.userDefaults.set(access_token, forKey: UserDefaultKeys.token)
        }
        if let tokenType = model?.token_type {
            Constants.userDefaults.set(tokenType, forKey: UserDefaultKeys.tokenType)
        }
        let name = model?.user?.name
        Constants.userDefaults.set(name, forKey: UserDefaultKeys.name)

//        if let phoneNumber = model?.data?.phoneNumber {
//            Constants.userDefaults.set(phoneNumber, forKey: UserDefaultKeys.phoneNumber)
//        }
        if let cityCode = model?.user?.location_id {
            Constants.userDefaults.set(cityCode, forKey: UserDefaultKeys.cityCode)
        }
//        if let photo = model?.data?.photo {
//            Constants.userDefaults.set(photo, forKey: UserDefaultKeys.photo)
//        }
        if let id = model?.user?.id {
            Constants.userDefaults.set(id, forKey: UserDefaultKeys.id)
        }
//        if let accountType = model?.data?.account_type {
//            Constants.userDefaults.set(accountType, forKey: UserDefaultKeys.accountType)
//        }
//        if let isActive = model?.data?.isActive {
//            Constants.userDefaults.set(isActive, forKey: UserDefaultKeys.isActive)
//        }
//        if let verified = model?.data?.verified {
//            Constants.userDefaults.set(verified, forKey: UserDefaultKeys.verified)
//        }
    }

}

