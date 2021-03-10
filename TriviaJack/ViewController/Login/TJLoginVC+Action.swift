//
//  TJLoginVC+Action.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 18/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit

extension TJLoginVC {
    
    @IBAction func buttonLoginTapped(_ sender: UIButton) {
        Console.log("buttonLoginTapped")
        checkForValidation()
    }
    @IBAction func buttonSignupTapped(_ sender: UIButton) {
        Console.log("buttonSignupTapped")
        let vc = TJSignupVC.instantiate(fromAppStoryboard: .registration)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func checkForValidation(){
        var params = [String: Any]()
        guard let text = textFieldEmail.text, !text.trim().isEmpty else{
            DisplayBanner.show(message: Validation.errorEmailEmpty)
            return
        }
        guard text.isValidEmail() else{
            DisplayBanner.show(message: Validation.errorEmailInvalid)
            return
        }
        guard let password = textFieldPassword.text, !password.trim().isEmpty else {
            DisplayBanner.show(message: Validation.errorPasswordEmpty)
            return
        }
        guard password.checkForValidLength(min: 6, max: 15) else {
            DisplayBanner.show(message: Validation.errorPasswordInvalid)
            return
        }
        params["password"] = password
        params["email"] = text
        params["device_type"] = "ios"
        params["device_token"] = "sdfsdafadsf"
        params["login_by"] = "Manual"
        params["device_id"] = "2131"
        requestServer(param: params)
    }
    
    
    @IBAction func buttonFacebookTapped(_ sender: UIButton) {
        Console.log("buttonFacebookTapped")
        
    }
    
    
    @IBAction func buttonAppleTapped(_ sender: UIButton) {
        Console.log("buttonAppleTapped")
        
    }
    @IBAction func buttonForgotPasswordTapped(_ sender: UIButton) {
        Console.log("buttonForgotPasswordTapped")
        let vc = TJForgotPasswordVC.instantiate(fromAppStoryboard: .registration)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func buttonShowAndHidePasswordTapped(_ sender: UIButton) {
        Console.log("buttonShowAndHidePasswordTapped")
        if textFieldPassword.isSecureTextEntry {
            sender.setImage(UIImage(named: "passwordshow"), for: .normal)
            textFieldPassword.isSecureTextEntry = false
        }
        else if !textFieldPassword.isSecureTextEntry {
            sender.setImage(UIImage(named: "passwordhide"), for: .normal)
            textFieldPassword.isSecureTextEntry = true
        }
    }
}
