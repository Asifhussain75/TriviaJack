//
//  TJLoginVC.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 18/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit

class TJLoginVC: UIViewController {

    
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var buttonLogin: UIView!
    @IBOutlet weak var viewFacebook: UIView!
    @IBOutlet weak var viewApple: UIView!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonShowAndHidePassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    func setup() {
        buttonShowAndHidePassword.setImage(UIImage(named: "passwordhide"), for: .normal)
        viewCard.makeRoundCorner(20)
        buttonLogin.makeRoundCorner(23)
        viewFacebook.makeRoundCorner(23)
        viewApple.makeRoundCorner(23)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}
