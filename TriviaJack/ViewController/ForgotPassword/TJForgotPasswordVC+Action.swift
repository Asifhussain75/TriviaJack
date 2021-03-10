//
//  TJForgotPasswordVC+Action.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 20/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit

extension TJForgotPasswordVC {
    @IBAction func buttonSubmitTapped(_ sender: UIButton) {
        Console.log("buttonSubmitTapped")
        checkForValidation()
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
        params["email"] = text
        requestServerForgetPassword(param: params)
    }
}
