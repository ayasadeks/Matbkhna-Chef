//
//  SearchResturantsModel.swift
//  ChefApp
//
//  Created by Admin on 12/4/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


struct SearchResturantsDataArrayModel : Codable{
    let id: Int?
    let name : String?
    let email : String?
    let phone : String?
    let logo : String?
    let cover : String?
    let description : String?
    let cityId : Int?
    let latitude : String?
    let longitude : String?
    let openStatus : Bool?
    let rate : String?
    let distance : Int?
}
struct AllResturantsResponseData: Codable {
    let imageUrl : String?
    let data: [SearchResturantsDataArrayModel]?
    let paginate: Paginate?
    let status_code : Int?
}
