//
//  UIButton+Addition.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 15/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func setGradientBlueGreenLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = 5.0
        gradientLayer.colors = [UIColor(hexString: "#08d0e6").cgColor , UIColor(hexString: "#00ddd0").cgColor]//UIColor(hexString: "#0ece06").cgColor, //UIColor(hexString: "#28a6ff").cgColor,
        
        //        gradientLayer.locations = [NSNumber(value: 0.0), NSNumber(value: 1), NSNumber(value: 0.0),NSNumber(value: 1),NSNumber(value: 0), NSNumber(value: 1), NSNumber(value: 0), NSNumber(value: 1)]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    func setCharacterSpacing(attributedString: NSMutableAttributedString){
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 3.5, range: NSRange(location: 0, length: attributedString.length))
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
    func setCharacterSpacing(text: String, hexString: String = "#4FE2E7"){
        let attributedStringColor = [NSAttributedString.Key.foregroundColor : UIColor(hexString: hexString)]
        let langTextAttributed = NSMutableAttributedString(string: text, attributes: attributedStringColor)
        self.setAttributedTitle(langTextAttributed, for: .normal)
        self.setCharacterSpacing(attributedString: langTextAttributed)
    }
    
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        //NSAttributedStringKey.foregroundColor : UIColor.blue
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
