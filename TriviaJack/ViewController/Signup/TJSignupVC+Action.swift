//
//  TJSignupVC+Action.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 18/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit

extension TJSignupVC {

    
    @objc func buttonBackTapped(){
        Console.log("buttonMenuTapped")
        popViewController()
    }
    @IBAction func buttonBackAction(_ sender: UIButton) {
        Console.log("buttonBackAction")
        popViewController()
    }

    @IBAction func buttonSignupTapped(_ sender: UIButton) {
        Console.log("buttonSignupTapped")
        //let vc = TJUploadProfileVC.instantiate(fromAppStoryboard: .registration)
        //navigationController?.pushViewController(vc, animated: true)
        checkForValidation()
    }
    
    func checkForValidation() {
        guard let name = textFieldName.text, !name.trim().isEmpty else{
            DisplayBanner.show(message: Validation.errorNameEmpty)
            return
        }
        guard let email = textFieldEmail.text, !email.trim().isEmpty else{
            DisplayBanner.show(message: Validation.errorEmailEmpty)
            return
        }
        guard email.isValidEmail() else{
            DisplayBanner.show(message: Validation.errorEmailInvalid)
            return
        }
        guard let password = textFieldPassowrd.text, !password.trim().isEmpty else {
            DisplayBanner.show(message: Validation.errorPasswordEmpty)
            return
        }
        guard password.checkForValidLength(min: 6, max: 15) else {
            DisplayBanner.show(message: Validation.errorPasswordInvalid)
            return
        }
        guard let confirmPassword = textFieldConfirmPassowrd.text, !confirmPassword.trim().isEmpty else {
            DisplayBanner.show(message: Validation.errorEnterConfirmPassword)
            return
        }
        guard confirmPassword.checkForValidLength(min: 6, max: 15) else {
            DisplayBanner.show(message: Validation.errorPasswordInvalid)
            return
        }
        guard password == confirmPassword else {
            DisplayBanner.show(message: Validation.errorPasswordMismatch)
            return
        }
        guard let location_id = locationId else {
            return
        }
        let params = ["name": name, "email" : email, "password": password, "device_type": "ios", "location_id" : location_id, "device_token" : "sdadfsahjghjgfhjdfasdf", "device_id": "1231","login_by": "Manual", "confirm_password": password]
        requestServer(param: params)
    }
    @IBAction func buttonShowAndHidePasswordTapped(_ sender: UIButton) {
        Console.log("buttonShowAndHidePasswordTapped")
        if textFieldPassowrd.isSecureTextEntry {
            sender.setImage(UIImage(named: "passwordshow"), for: .normal)
            textFieldPassowrd.isSecureTextEntry = false
        }
        else if !textFieldPassowrd.isSecureTextEntry {
            sender.setImage(UIImage(named: "passwordhide"), for: .normal)
            textFieldPassowrd.isSecureTextEntry = true
        }
    }
    
    @IBAction func buttonShowAndHideConfirmPasswordTapped(_ sender: UIButton) {
        Console.log("buttonShowAndHidePasswordTapped")
        if textFieldConfirmPassowrd.isSecureTextEntry {
            sender.setImage(UIImage(named: "passwordshow"), for: .normal)
            textFieldConfirmPassowrd.isSecureTextEntry = false
        }
        else if !textFieldConfirmPassowrd.isSecureTextEntry {
            sender.setImage(UIImage(named: "passwordhide"), for: .normal)
            textFieldConfirmPassowrd.isSecureTextEntry = true
        }
    }
    
    @IBAction func buttonSelectCityTapped(_ sender: UIButton) {
        Console.log("buttonSelectCityTapped")
        let vc = TJSelectCityVC.instantiate(fromAppStoryboard: .registration)
        vc.delegate = self
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.shadowImage = UIImage()
        present(navigationController, animated: true, completion: nil)
    }
    
}
extension TJSignupVC: CityDelegate{
    func selected(cityName: String?, cityCode: Int?) {
        labelCity.text = cityName
        locationId = "\(cityCode ?? 0)"
    }
}
