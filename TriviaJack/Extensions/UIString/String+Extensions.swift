//
//  String+Extensions.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 15/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//


import Foundation
import UIKit

extension String {
    static func getString(_ message: Any?) -> String {
        if let string = message {
            guard let strMessage = string as? String else {
                guard let doubleValue = string as? Double else {
                    guard let intValue = string as? Int else {
                        guard string is Float else {
                            guard let int64Value = string as? Int64 else {
                                guard let int32Value = string as? Int32 else {
                                    guard let int16Value = string as? Int32 else {
                                        return ""
                                    }
                                    return String(int16Value)
                                }
                                return String(int32Value)
                            }
                            return String(int64Value)
                        }
                        return String(format: "%.2f", string as! Float)
                    }
                    return String(intValue)
                }
                let formatter = NumberFormatter()
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 2
                formatter.minimumIntegerDigits = 1
                guard let formattedNumber = formatter.string(from: NSNumber(value: doubleValue)) else {
                    return ""
                }
                return formattedNumber
            }
            return strMessage
        }
        return ""
    }
    var html2AttributedString: NSAttributedString? {
        //        guard
        //            let data = data(using: String.Encoding.utf16)
        //            else { return nil }
        do {
            return try NSAttributedString(data: Data(utf8), options: [.documentType:NSAttributedString.DocumentType.html,.characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch  {
            return  nil
        }
    }
    
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    func isValidPhone(phone: String) -> Bool {
        let phoneRegex = "^[0-9]{6,14}$";
        let valid = NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: phone)
        return valid
    }
    
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9.-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    func isValidPassword()-> Bool {
        let regex = try! NSRegularExpression(pattern: "", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    //    func isValidPassword()-> Bool {
    //           let regex = try! NSRegularExpression(pattern: "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}", options: .caseInsensitive)
    //           return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    //       }
    //
    
    //    func isContactNumberValid() -> Bool {
    //        if(self.characters.count >= 8 && self.characters.count <= 16){
    //            return true
    //        }
    //        else{
    //            return false
    //        }
    //    }
    
    static func randomString() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...9).map{ _ in letters.randomElement()! })
    }
    
    static func getString(_ value: Int?) -> String{
        if let value = value {
            return "\(value)"
        }
        return ""
    }
    
    func charactorCount(str: String) -> Int {
        let s = str.count
        Console.log(s)
        return s
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    func htmlAttributed(family: String?, size: CGFloat, color: UIColor) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(size)pt !important;" +
                "color: #\(color.hexString) !important;" +
                "font-family: \(family ?? "Helvetica"), Helvetica !important;" +
            "}</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "\(self)", comment: "")
    }
    
    var withoutHtmlTags: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: " \n", options:
            .regularExpression, range: nil).replacingOccurrences(of: "&[^;]+;", with:
                "", options:.regularExpression, range: nil)
    }
    func checkForValidLength(min: Int, max: Int) -> Bool{
        return self.count >= min && self.count <= max
    }
    static func join(strings: [String?]?, separator: String) -> String {
        guard let strings = strings else{return ""}
        return strings.compactMap { $0 }.joined(separator: separator)
    }
    func attributedStringWithColor(_ strings: [String], color: UIColor, characterSpacing: UInt? = nil) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        for string in strings {
            let range = (self as NSString).range(of: string)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: Constants.FontName.stawixMedium, size: 16)!, range: range)
        }
        guard let characterSpacing = characterSpacing else {return attributedString}
        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))
        return attributedString
    }
}


