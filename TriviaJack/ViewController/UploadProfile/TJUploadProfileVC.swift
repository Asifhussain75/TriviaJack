//
//  TJUploadProfileVC.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 19/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import UIKit

class TJUploadProfileVC: UIViewController {

    @IBOutlet weak var buttonSkip: UIButton!
    @IBOutlet weak var buttonGetStarted: UIButton!
    @IBOutlet weak var buttonRemove: UIButton!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var imageProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setup()
    }
    
    func setup() {
        viewCard.makeRoundCorner(20)
        viewImage.makeRounded()
        buttonSkip.makeRoundCorner(23)
        buttonSkip.makeBorder(2, color: .white)
        buttonGetStarted.makeRoundCorner(23)
        buttonRemove.makeRoundCorner(23)
        setupNavigationBar()
    }
    
    func setupNavigationBar(){
        navigationItem.title = "Upload Profile Picture"
        setLeftBarButtonItem(imageName: "back")
        navigationItem.leftBarButtonItem?.action = #selector(buttonBackTapped)
    }
    
}


extension TJUploadProfileVC: MediaSelectedDelegate{
    func deletedImage() {
        if kUserDefaults.getUserProfileImage().isEmpty  {
            DisplayBanner.show(message: "There is no image found to delete.")
        } else {
            //self.requestServerDeleteProfile()
        }
    }
    func permissionDenied() {
        // showAlert()
    }
    func selectedMediaType(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 0.5) {
            requestServerImageUpload(params: ["avatar": MultiPart(data: imageData, fileNameWithExt: "avatar.png", serverKey: "avatar", mimeType: .image)])
            
        }
    }
}
