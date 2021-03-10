//
//  CustomTextView.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 15/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//


import UIKit

class TJCustomMediumTextView: UITextView {
    override func awakeFromNib() {
        super.awakeFromNib()
        text = text?.localized()
        let size: CGFloat = CGFloat(tag == 0 ? 16 : tag)
        font = UIFont.kAppDefaultFontMedium(ofSize: size)
    }
}
class TJCustomBoldTextView: UITextView {
    override func awakeFromNib() {
        super.awakeFromNib()
        text = text?.localized()
        let size: CGFloat = CGFloat(tag == 0 ? 16 : tag)
        font = UIFont.kAppDefaultFontBold(ofSize: size)
    }
}
