//
//  TJUploadProfileVC+Service.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 21/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import Foundation
import PromiseKit

extension TJUploadProfileVC {
    func requestServerImageUpload(params: [String: Any]) {
        Loader.show()
        firstly{
            service!.uploadProfilePic(onProgress: { (progress) in
                Console.log("progress \(progress)")
            }, parameters: params)
        }.done { (model: UploadProfile) in
            self.handleResponseUploadProfile(model: model)
        }.catch { (error) in
            print(error)
            DisplayBanner.show(message: error.localizedDescription)
        }.finally {
            Loader.hide()
        }
    }
    func handleResponseUploadProfile(model: UploadProfile) {
        if model.status != 200 {
            DisplayBanner.show(message: model.msg)
            return
        }
        if let profile = model.data?.avatar {
            Constants.userDefaults.set(profile, forKey: UserDefaultKeys.photo)
            imageProfile.kf.setImage(with: URL(string: API.assetsUrl + kUserDefaults.getUserProfileImage()), placeholder: UIImage(named: "user-placeholder"))
            Console.log("\(API.assetsUrl + kUserDefaults.getUserProfileImage())")
            //delegate?.updateProfileData()
        }
//        if kUserDefaults.getUserProfileImage().contains("https://") {
//            imageProfile.kf.setImage(with: URL(string: kUserDefaults.getUserProfileImage()), placeholder: UIImage(named: "user-placeholder"))
//        } else {
//            imageProfile.kf.setImage(with:  URL(string: API.assetsUrl + kUserDefaults.getUserProfileImage()) , placeholder: UIImage(named: "user-placeholder"))
//        }
        DisplayBanner.show(message: model.msg)
    }
}



extension TJUploadProfileVC {
    func requestServerDeleteProfile() {
        Loader.show()
        firstly{
            service!.deleteProfilePic(parameters: nil)
        }.done { (model: DeleteProfile) in
            self.handleResponseDeleteProfile(model: model)
        }.catch { (error) in
            print(error)
            DisplayBanner.show(message: error.localizedDescription)
        }.finally {
            Loader.hide()
        }
    }
    func handleResponseDeleteProfile(model: DeleteProfile) {
        if model.status == 400 {
            DisplayBanner.show(message: "There is nothing changed.")
            return
        }
        if model.status != 1 {
            DisplayBanner.show(message: model.msg)
            return
        }
        Constants.userDefaults.set(nil, forKey: UserDefaultKeys.photo)
      //delegate?.updateProfileData()
        imageProfile.image = UIImage(named: "logo")
        DisplayBanner.show(message: model.msg)
    }
}
