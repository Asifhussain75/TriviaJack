//
//  DisplayBanner.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 19/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//


import Foundation
import BRYXBanner

class DisplayBanner {
    class  func show(message:String?, duration: Double = 1.2) {
        guard let message = message, !message.isEmpty else {
            return
        }
        //let banner = Banner(title: message, subtitle: "", image: nil, backgroundColor: UIColor(red:0.00/255.0, green:124.00/255.0, blue:198.00/255.0, alpha:1.000))
        let banner = Banner(title: message.localized() , subtitle: "", image: nil, backgroundColor: Constants.Color.appDefaultBlue)
        banner.dismissesOnTap = true
        banner.show(duration: duration)
        Console.log("DisplayBanner \(message)")
    }
}
