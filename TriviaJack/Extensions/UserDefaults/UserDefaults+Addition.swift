//
//  UserDefaults+Addition.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 15/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import Foundation
extension UserDefaults {
    
    func isUserLogin() -> Bool {
        return bool(forKey: UserDefaultKeys.kIsLoggedIn)
    }
        
    func isUserVerified() -> Bool {
        return (String.getString(string(forKey: UserDefaultKeys.kIsVerified)) == "1" ? true : false)
    }
    
    func getUserId() -> String {
        return String.getString(string(forKey: UserDefaultKeys.id))
    }

    func getSubscriptionStatus() -> String {
        return String.getString(string(forKey: UserDefaultKeys.subsriptionStatus))
    }
    
    func getAccessToken() -> String {
        return String.getString(string(forKey: UserDefaultKeys.token))
    }
    func getTokenType() -> String {
        return String.getString(string(forKey: UserDefaultKeys.tokenType))
    }
    func getCheckStatus() -> String {
        return String.getString(string(forKey: UserDefaultKeys.status))
    }
    func getAccountType() -> String {
        return String.getString(string(forKey: UserDefaultKeys.accountType))
    }
    func getUserName() -> String {
        return String.getString(string(forKey: UserDefaultKeys.name))
    }
    func getJobTitle() -> String {
        return String.getString(string(forKey: UserDefaultKeys.jobTitle))
    }
    func getUserEmail() -> String {
        return String.getString(string(forKey: UserDefaultKeys.email))
    }

    func getUserGender() -> String {
        return String.getString(string(forKey: UserDefaultKeys.gender))
    }

    func getUserAddress() -> String {
        return String.getString(string(forKey: UserDefaultKeys.address))
    }

    func getUserDOB() -> String {
        return String.getString(string(forKey: UserDefaultKeys.dob))
    }

    func getUserProfileImage() -> String {
        return String.getString(string(forKey: UserDefaultKeys.photo))
    }

    func getUserPhoneNumber() -> String {
        return String.getString(string(forKey: ServerKeys.phoneNumber))
    }
    func getUserCityCode() -> String {
        return String.getString(string(forKey: UserDefaultKeys.cityCode))
    }
}

