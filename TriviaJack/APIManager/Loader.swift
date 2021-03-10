//
//  Loader.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 19/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//


import Foundation

class Loader {
    class func show() {
        Console.log("Loader Show")
        SKActivityIndicator.spinnerStyle(.spinningHalfCircles)
        SKActivityIndicator.spinnerColor(Constants.Color.appDefaultBlue)
        SKActivityIndicator.show("", userInteractionStatus: false)
    }
    class func showWithMessage(percentage: Double?) {
        Console.log("Loader Show")
        SKActivityIndicator.spinnerStyle(.spinningHalfCircles)
        SKActivityIndicator.spinnerColor(Constants.Color.appDefaultBlue)
        SKActivityIndicator.show("Please wait downloading... \(percentage) %", userInteractionStatus: false)
    }
    class func hide() {
        Console.log("Loader Hide")
        SKActivityIndicator.dismiss()
    }
    class func showUserInteractionStatus() {
        Console.log("Loader Show")
        SKActivityIndicator.spinnerStyle(.spinningFadeCircle)
        SKActivityIndicator.spinnerColor(Constants.Color.appDefaultBlue)
        SKActivityIndicator.show("", userInteractionStatus: true)
    }
}
