//
//  MainTabBarControllerVC.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 21/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit

class MainTabBarControllerVC: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        Constants.sharedAppDelegate.setSwipe(enabled: false, navigationController: navigationController)
        
        // self.viewControllers?.remove(at: 1)
    }
    
    
}
