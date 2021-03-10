//
//  CustomButton.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 15/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//


import UIKit

class TJCustomMediumButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.text = titleLabel?.text?.localized()
        let size: CGFloat = CGFloat(tag == 0 ? 16 : tag)
        titleLabel?.font = UIFont.kAppDefaultFontMedium(ofSize: size)
    }
}
class TJCustomBoldButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.text = titleLabel?.text?.localized()
        let size: CGFloat = CGFloat(tag == 0 ? 16 : tag)
        titleLabel?.font = UIFont.kAppDefaultFontBold(ofSize: size)
    }
}
