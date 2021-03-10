//
//  TJForgotPasswordVC.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 20/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit

class TJForgotPasswordVC: UIViewController {
    
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var buttonSubmit: UIButton!
    @IBOutlet weak var textFieldEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        viewCard.makeRoundCorner(20)
        buttonSubmit.makeRoundCorner(10)
        setupNavigationBar()
    }
    
    func setupNavigationBar(){
        navigationItem.title = "Forgot Password"
        setLeftBarButtonItem(imageName: "back")
        navigationItem.leftBarButtonItem?.action = #selector(buttonBackTapped)
    }
    @objc func buttonBackTapped(){
        Console.log("buttonMenuTapped")
        popViewController()
    }
}
