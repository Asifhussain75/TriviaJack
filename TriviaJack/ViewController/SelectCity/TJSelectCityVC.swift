//
//  TJSelectCityVC.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 20/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit

protocol CityDelegate: class {
    func selected(cityName: String?, cityCode: Int?)
}


class TJSelectCityVC: UIViewController {

    @IBOutlet weak var tableViewCity: UITableView!
    var cityList: CityList?
    var delegate: CityDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestServer()
        setup()
    }

    func setup() {
        tableViewCity.delegate = self
        tableViewCity.dataSource  = self
        registerTableViewCell()
        setupNavigationBar()
        
    }
    
    func setupNavigationBar(){
        navigationItem.title = "Select City"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: Constants.FontName.stawixMedium, size: 16)!]
        setLeftBarButtonItem(imageName: "back")
        navigationItem.leftBarButtonItem?.action = #selector(buttonBackTapped)
    }
    func registerTableViewCell() {
        tableViewCity.registerReusableCell(CityListTableCell.self)
    }
    @objc func buttonBackTapped(){
        Console.log("buttonMenuTapped")
        dismissViewController()
    }
}
