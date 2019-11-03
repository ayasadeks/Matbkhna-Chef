//
//  InformationModel.swift
//  ChefApp
//
//  Created by Admin on 10/31/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
struct AllUserUpdateResponseData : Codable {
    let status_code : Int?
    let message : String?
    let data : UserUpdateData?
    let status_message : String?
}

struct UserUpdateData : Codable{
    let id: Int?
    let name : String?
    let email : String?
    let phone : String?
    let verified : Bool?
    let logo : String?
    let cover: String?
    let description : String?
    let cityId : Int?
    let latitude : Int?
    let longitude : Int?
    let openStatus : Bool?
    let rate : String?
    let distance : Int?
}
