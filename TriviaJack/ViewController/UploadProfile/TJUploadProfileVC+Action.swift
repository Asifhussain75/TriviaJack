//
//  TJUploadProfileVC+Action.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 19/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit

extension TJUploadProfileVC {
    
    @objc func buttonBackTapped(){
        Console.log("buttonMenuTapped")
        popViewController()
    }

    @IBAction func buttonEditTapped(_ sender: UIButton) {
        Console.log("buttonEditTapped")
        MediaManager.shared.showMediaSheetOn(self, allowsEditing: true)
        MediaManager.shared.delegate = self
    }
    
    @IBAction func buttonRemoveTapped(_ sender: UIButton) {
        Console.log("buttonRemoveTapped")
        if kUserDefaults.getUserProfileImage().contains("/storage/avatar") {
            requestServerDeleteProfile()
        } else {
            DisplayBanner.show(message: "There is no image for delete.")
        }
    }
    @IBAction func buttonGetStartedTapped(_ sender: UIButton) {
        Console.log("buttonGetStartedTapped")
        let vc = MainTabBarControllerVC.instantiate(fromAppStoryboard: .home)
        navigationController?.pushViewController(vc, animated: true)
    }
}
