//
//  TJSelectCityVC+TableView.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 20/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit


extension TJSelectCityVC :  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCity.dequeueReusableCell(CityListTableCell.self, for: indexPath)
        let data = cityList?.data?[indexPath.row]
        cell.labelCityName.text = data?.city
        return cell
    }
    
}
extension TJSelectCityVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = cityList?.data?[indexPath.row]
        dismiss(animated: true) {
            self.delegate?.selected(cityName: city?.city, cityCode: city?.id)
        }
    }
}
