//
//  TJLoginVC+Service.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 18/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import Foundation
import PromiseKit

extension TJLoginVC {
    func requestServer(param: [String : Any]?) {
        self.view.endEditing(true)
        Loader.show()
        firstly{
            service!.login(parameters: param)
        }.done { (model: RegistrationModel) in
            self.handleResponse(model: model)
        }.catch { (error) in
            print(error)
            DisplayBanner.show(message: error.localizedDescription)
        }.finally {
            Loader.hide()
        }
    }
    func handleResponse(model: RegistrationModel) {
        Console.log(model)
        kAppDelegate.setValueUserDefault(model: model)
        if model.status == 200 {
            let vc = TJUploadProfileVC.instantiate(fromAppStoryboard: .registration)
           // vc.registerModel = model
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            DisplayBanner.show(message: model.msg)
        }
    }
}


