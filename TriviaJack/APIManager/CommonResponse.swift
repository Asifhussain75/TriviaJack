//
//  CommonResponse.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 19/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//


import Foundation
struct CommonResponse: Decodable {
    let message: String?
    let status: Int?
    let statusMessage: String?
    let tokenStatus: Bool?
    let msg: String?
    let app_timer: Int?
    let timer_status: String?
    let expireTimestamp : String?
    let isSubscribed : Int?
    let type : String?
}
