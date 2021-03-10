//
//  Constants.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 15/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import Foundation
import Foundation
import UIKit

let kAppDelegate = UIApplication.shared.delegate as! AppDelegate
let kScreenHeight = UIScreen.main.bounds.height
let kScreenWidth = UIScreen.main.bounds.width
let kUserDefaults = UserDefaults.standard


struct Constants {
    static let sharedApplication = UIApplication.shared
    static let sharedAppDelegate = sharedApplication.delegate as! AppDelegate
    static let userDefaults  = UserDefaults.standard
    static let screen = UIScreen.main
    static let fileManager = FileManager.default
    static let userListPlaceholder = UIImage(named: "user-placeholder")
    
    
    struct FontName {
        static let stawixBold = "SoinSansNeue-Bold"
        static let stawixMedium = "SoinSansNeue-Medium"
    }
    struct Color {
        static let appDefaultRed = UIColor(hexString: "#BD252C")
        static let appDefaultPinkLight = UIColor.getRGBColor(246, g: 226, b: 227)
        static let appDefaultGray = UIColor(hexString: "#707070")
        static let appDefaultBlack = UIColor(hexString: "#000000")
        static let appDefaultWhite = UIColor(hexString: "#ffffff")
        static let appDefaultLightGray = UIColor(hexString: "#AFAFAF")
        static let appDefaultDarkGray = UIColor(hexString: "#202020")
        static let appDefaultBlue = UIColor(hexString: "#0000FF")
        static let appDefaultTermsColor = UIColor.getRGBColor(186, g: 186, b: 189)
        static let appDefaultGrayReview = UIColor(hexString: "#808080")
        static let appDefaultGrayNintyFive = UIColor(hexString: "#F2F2F2")
        let kAppDefaultColor = UIColor(hexString: "#2867B2")
    }
    
    struct ErrorMessages {
        static let noNetwork = "Check your internet connection."
    }
}

struct CellIdentifier {
    //MARK:- TableViewCell
    static let sideMenuHeaderView = "TKSideMenuHeaderView"
    static let sideMenuTableCell = "TKSideMenuTableCell"
   
 
    
    //MARK:- CollectionViewCell
    
    static let onboardCollectionCell = "OnboardCollectionCell"
    static let homeBannerCollectionCell = "HomeBannerCollectionCell"
    static let audioBookCollectionCell = "ARAudioBookCollectionCell"
    
}

struct DebugMessages {
    static let wrongScreen = "Error in screen transition"
}

struct API {
    static let baseUrl = "http://3.126.198.134:3333"
    static let assetsUrl = "http://3.136.243.61/"
    static let ploicyLink = "http://3.126.198.134/"
}

struct MethodName {
    static let privacyPolicy = "policy/privacy.html"
    static let termAndCondition = "policy/terms.html"
}

struct WebViewUrl {
    static let about = "https://www.weekinchina.com/about/"
}

struct StatusCode{
    static let success = 200
    static let pageNotFound = 404
    static let unauthenticated = 401
    static let noDataFound = 400
    static let inactive = 500
    static let versionNotSupported = 505
    static let other = 201
}

struct Validation{
    static let errorEmailEmpty = "Please enter email address."
    static let errorPasswordEmpty = "Please enter password."
    static let errorEnterOTP = "Please fill otp."
    static let errorFirstNameEmpty = "Please enter first name."
    static let errorNameEmpty = "Please enter  name."
    static let errorLastNameEmpty = "Please enter last name."
    static let errorDOBEmpty = "Please enter date of birth."
    static let errorSelectDoctorEmpty = "Please select referral."
    static let errorDescriptionEmpty = "Please enter feedback."
    static let errorIntertNameAndUsername = "Please insert name and surname."
    static let errorSelectDate = "Please select date."
    static let errordesc = "Please enter place."
    static let errorSignature = "Please add your signature in signature field to proceed further."
    static let errorSelectFeedbackIcon = "Please select feedback icon."
    
    static let errorCreateUsername = "Please create username."
    static let errorConfirmUsername = "Please confirm username."
    static let errorUsernameNotMetched = "Username mismatched."
    static let errorEmailInvalid = "Please enter valid email address."
    static let errorSelectIndustry = "Please select Industry."
    static let errorSelectLocation = "Please select location."
    static let errorUsername = "Please enter username."
    
    static let errorEnterOldPassword = "Please enter current password."
    static let errorEnterNewPassword = "Please enter new password."
    static let errorEnterConfirmPassword = "Please enter confirm password."
    static let errorEnterOldNewPasswordSame = "Current and new password can't same"
    static let errorEmptyCountry = "Please select country."
    static let errorEmptyCountryCode = "Please enter country code."
    static let errorEmptyPhoneNumber = "Please enter phone number."
    static let errorInvalidPhoneNumber = "Please enter valid phone number."
    static let errorNotNumeric = "Please enter numbers."
    static let errorPhoneLength = "Phone Number should be between 8 to 15 digits."
    
    static let errorNameInvalid = "Please enter valid name"
    static let errorNameLength = "Name should be between 3 to 10 characters."
    static let errorPasswordInvalid = "Password must be at least 6 characters up to max 15."
    static let errorPasswordLength = "Password should be less than 15 characters."
    static let errorPasswordLengthInvalid = "Password must contain characters between 6 to 10."
    static let errorConfirmPasswordLengthInvalid = "Password must contain characters between 6 to 10."
    static let errorPasswordMismatch = "Password and confirm password should be same."
    static let errorNointernet = "No internet connection."
}

struct ErrorMessages{
    static let errorToHandleInSuccess = "Something is wrong while getting success"
    static let errorToHandleInFailure = "Something is wrong while getting failure"
    static let errorNothingToLog = "There is nothing to log on console"
    static let somethingWentWrong = "Something went wrong"
    static let unableToParseError = "Unable to parse error response"
    static let invalidUserId = "Unable to find userId"
    static let networkError = "Network not available"
    
}

struct Console{
    static func log(_ message: Any?){
        print(message ?? ErrorMessages.errorNothingToLog)
    }
}

struct ServerKeys {
    static let firstName = "first_name"
    static let lastName = "last_name"
    static let email = "user_email"
    static let phoneNumber = "phone"
    static let data = "data"
    static let message = "message"
    static let token = "token"
    static let image = "image"
    static let pdf = "signature_doc"
    static let username = "username"
    static let password = "password"
    static let socialId = "social_id"
    static let requestType = "login_type"
    static let social = "social"
    static let userImage = "user_image"
}

struct UserDefaultKeys{
    static let token = "token"
    static let status = "status"
    static let tokenType = "tokenType"
    static let id = "id"
    static let kIsVerified = "isVerified"
    static let kIsLoggedIn = "isLogin"
    static let photo = "photo"
    static let accountType = "accountType"
    static let name = "name"
    static let jobTitle = "jobTitle"
    static let cityCode = "cityCode"
    static let email = "email"
    static let dob = "dob"
    static let gender = "gender"
    static let address = "address"
    static let isActive = "isActive"
    static let verified = "verified"
    static let uuid = "UUID"
    static let deviceToken = "DeviceToken"
    static let subsriptionStatus = "SubsriptionStatus"
    static let userSubscription = "UserSubscription"
}

enum LoginType: String {
    case normal
    case facebook
    case apple
}

enum CurrentScreen: String {
    case home
    case option
    case dashboard
}

