//
//  RegistrationModel.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 20/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import Foundation

struct RegistrationModel: Codable {
    let status : Int?
    let token_type : String?
    let access_token : String?
    let user: UserInfo?
    let msg: String?

}

struct UserInfo: Codable {
    let name : String?
    let email : String?
    let device_id : String?
    let device_token : String?
    let device_type : String?
    let login_by : String?
    let location_id : Int?
    let id : Int?
    let avatar: String?
    let status: Int?
}
