//
//  UIFont+Extension.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 15/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//


import UIKit

extension UIFont {
    class func printFontFamily(){
        for family in UIFont.familyNames {
            print("Family \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("Members----\(name)")
            }
        }
    }
    static func kAppDefaultFontMedium(ofSize size: CGFloat = 16) -> UIFont {
        var  widthFactor: CGFloat = 1
        if UIDevice.current.userInterfaceIdiom == .phone {
            widthFactor = kScreenWidth / 320
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            widthFactor = kScreenWidth / 768
        }
        return UIFont(name: "SoinSansNeue-Medium", size: size * widthFactor)!
    }
    static func kAppDefaultFontBold(ofSize size: CGFloat = 16) -> UIFont {
        var  widthFactor: CGFloat = 1
        if UIDevice.current.userInterfaceIdiom == .phone {
            widthFactor = kScreenWidth / 320
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            widthFactor = kScreenWidth / 768
        }
        return UIFont(name: "SoinSansNeue-Bold", size: size * widthFactor)!
    }
}
