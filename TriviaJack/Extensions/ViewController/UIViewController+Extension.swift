//
//  UIViewController+Extension.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 15/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//


import Foundation
import UIKit

extension UIViewController {
    
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    func showAlert(title: String, message: String)  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "ok", style: .default) { (_) in
        }
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    func delay(time:TimeInterval,completionHandler: @escaping ()->()) {
        let when = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: when) {
            completionHandler()
        }
    }
    func setLeftBarButtonItem(imageName: String){
        let image =  UIImage.init(named: imageName)?.withRenderingMode(.alwaysOriginal)
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = barButtonItem
    }
    func setRightBarButtonItem(imageName: String){
        let image =  UIImage.init(named: imageName)?.withRenderingMode(.alwaysOriginal)
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = barButtonItem
        //navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
    
    func setNavigation(_ title: String) {
        navigationItem.title = title
    }
    
    func setRightBarButtonItem(title: String){
        let barButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: nil)
        barButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    func setCentreBarItem(title: String){
        let label = UILabel()
        label.text = title
        label.contentMode = .scaleAspectFit
        navigationItem.titleView = label
    }
    
    func setLeftBarButtonItemWithTitle(_ title: String, andImage image: UIImage?) {
        let titleLbl = UILabel()
        titleLbl.font = UIFont(name: Constants.FontName.stawixMedium, size: 20)
        titleLbl.text = title
        //titleLbl.numberOfLines = 2
        titleLbl.textColor = UIColor.white
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        let titleView = UIStackView(arrangedSubviews: [imageView, titleLbl])
        titleView.axis = .horizontal
        titleView.spacing = 10.0
         let barButtonItem = UIBarButtonItem(customView: titleView)
        navigationItem.leftBarButtonItem = barButtonItem
    }
    func getTimeDifference(dateString: String, isFullFormat: Bool = false) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        //        if isFullFormat {
        //            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //        } else {
        //            formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        //        }
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let startDate = formatter.date(from: dateString)
        let endDate = Date()
        let indian = Calendar(identifier: .indian)
        let components =  indian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: startDate ?? Date(), to: endDate)
        let years = components.year
        let months = components.month
        let days = components.day
        let hour = components.hour
        let minute = components.minute
        let second = (components.second ?? 30) - 30
        
        if years == 0 {
            if months == 0 {
                if days == 0 {
                    if hour == 0 {
                        if minute == 0 {
                            return "\(String.getString(second)) Seconds ago"
                        } else {
                            return "\(String.getString(minute)) Minutes ago"
                        }
                    } else {
                        return "\(String.getString(hour)) Hours ago"
                    }
                } else {
                    return "\(String.getString(days))" + (days == 1 ? " day ago" : " days ago")
                }
            } else {
                return "\(String.getString(months))" + (months == 1 ? " Month ago" : " Months ago")
            }
        } else {
            return "\(String.getString(years))" + (years == 1 ? " Year ago" : " Years ago")
        }
    }
    func showCustomAlertWithHandler(title: String, message: String, titleColor: UIColor, messageColor: UIColor, alertTintColor: UIColor, buttonTitle: String, buttonTitleCancel: String, completion:@escaping()-> Void) {
        let alert = UIAlertController(title: title,message: message, preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: buttonTitle, style: .cancel) { (actionHandler) in
            completion()
        }
        let dismissAction = UIAlertAction(title: buttonTitleCancel, style: .default, handler: nil)
        alert.addAction(dismissAction)
        alert.addAction(deleteAction)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(hexString: "#EFEFEF")
        alert.view.tintColor = alertTintColor
        var attributedText = NSMutableAttributedString(string: title)
        var range = NSRange(location: 0, length: attributedText.length)
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont(name: Constants.FontName.stawixMedium, size: 17.0)!, range: range)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: titleColor, range: range)
        alert.setValue(attributedText, forKey: "attributedTitle")
        attributedText = NSMutableAttributedString(string: message)
        
        range = NSRange(location: 0, length: attributedText.length)
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont(name: Constants.FontName.stawixMedium, size: 13.0)!, range: range)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: messageColor, range: range)
        alert.setValue(attributedText, forKey: "attributedMessage")
        self.present(alert, animated: true, completion:  nil)
    }
    func alertToEncourageCameraAccessInitially() {
        let alert = UIAlertController (
            title: "IMPORTANT",
            message: "Camera access required for capturing card images!",
            preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Allow Camera", style: .cancel, handler: { (alert) -> Void in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }))
        let navi = kAppDelegate.window?.rootViewController as? UINavigationController
        navi?.present(alert, animated: true, completion: nil)
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    
}
