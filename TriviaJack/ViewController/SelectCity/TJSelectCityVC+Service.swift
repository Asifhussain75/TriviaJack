//
//  TJSelectCityVC+Service.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 20/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import Foundation
import PromiseKit

extension TJSelectCityVC {
    func requestServer() {
        self.view.endEditing(true)
        Loader.show()
        firstly{
            service!.cityList(parameters: nil)
        }.done { (model: CityList) in
            self.handleResponse(model: model)
        }.catch { (error) in
            print(error)
            DisplayBanner.show(message: error.localizedDescription)
        }.finally {
            Loader.hide()
        }
    }
    func handleResponse(model: CityList) {
        Console.log(model)
        cityList = model
        tableViewCity.reloadData()
    }
}
