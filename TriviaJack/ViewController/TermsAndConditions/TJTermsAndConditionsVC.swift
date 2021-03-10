//
//  TJTermsAndConditionsVC.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 20/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit

class TJTermsAndConditionsVC: UIViewController {

    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var buttonAgree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        viewCard.makeRoundCorner(20)
        buttonAgree.makeRoundCorner(10)
        setupNavigationBar()
    }
    
    func setupNavigationBar(){
        navigationItem.title = "Terms and conditions"
        setLeftBarButtonItem(imageName: "back")
        navigationItem.leftBarButtonItem?.action = #selector(buttonBackTapped)
    }
    @objc func buttonBackTapped(){
        Console.log("buttonMenuTapped")
        popViewController()
    }

}
