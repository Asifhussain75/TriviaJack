//
//  TJSignupVC.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 18/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit

class TJSignupVC: UIViewController {

    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var buttonSignup: UIView!
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassowrd: UITextField!
    @IBOutlet weak var textFieldConfirmPassowrd: UITextField!
    @IBOutlet weak var buttonShowAndHidePassword: UIButton!
    @IBOutlet weak var buttonShowAndHideConfirmPassword: UIButton!
    @IBOutlet weak var labelCity: UILabel!
    
    var locationId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    func setup() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        buttonShowAndHidePassword.setImage(UIImage(named: "passwordhide"), for: .normal)
        buttonShowAndHideConfirmPassword.setImage(UIImage(named: "passwordhide"), for: .normal)
        viewCard.makeRoundCorner(20)
        buttonSignup.makeRoundCorner(23)
        setupNavigationBar()
        
    }

    func setupNavigationBar(){
        navigationItem.title = "Sign up"
        setLeftBarButtonItem(imageName: "back")
        navigationItem.leftBarButtonItem?.action = #selector(buttonBackTapped)
    }
}
