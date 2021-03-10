//
//  TJForgotPasswordVC+Service.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 20/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import Foundation
import PromiseKit

extension TJForgotPasswordVC {
    func requestServerForgetPassword(param: [String : Any]?) {
        self.view.endEditing(true)
        Loader.show()
        firstly{
            service!.forgotPassword(parameters: param)
        }.done { (model: ForgetPasswordModel) in
            self.handleResponse(model: model, param: param)
        }.catch { (error) in
            print(error)
            DisplayBanner.show(message: error.localizedDescription)
        }.finally {
            Loader.hide()
        }
    }
    
    func handleResponse(model: ForgetPasswordModel, param: [String : Any]?) {
        if model.status != 200 {
            DisplayBanner.show(message: model.message)
            return
        }
        //let vc = TJTermsAndConditionsVC.instantiate(fromAppStoryboard: .registration)
        //navigationController?.pushViewController(vc, animated: true)
    }
}


struct ForgetPasswordModel: Decodable {
    let data : UserInfo?
    let message : String?
    let OTP : Int?
    let status : Int?
}


struct UploadProfile: Decodable {
    let data : UserInfo?
    let msg : String?
    let status : Int?
}



struct DeleteProfile: Decodable {
    let msg : String?
    let status : Int?
    let data: UserInfo?
}

