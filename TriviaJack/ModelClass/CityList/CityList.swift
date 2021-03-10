
//
//  CityList.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 20/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import Foundation


struct CityList : Codable {
    let status : Int?
    let data: [CityData]?
}

struct CityData: Codable {
    let id : Int?
    let city : String?
}
