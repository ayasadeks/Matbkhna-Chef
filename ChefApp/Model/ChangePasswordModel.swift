//
//  ChangePasswordModel.swift
//  ChefApp
//
//  Created by Admin on 9/18/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct AllChangePasswordResponseData : Codable{
    let status_code : Int
    let message : String?
    let data : ChangePasswordDataModel?
}

struct ChangePasswordDataModel: Codable {
    let id : Int?
    let name : String?
    let email : String?
    let phone : String?
    let logo : String?
    let cover : String?
    let description : String?
    let cityId : Int?
    let latitude : Int?
    let longitude : Int?
    let openStatus : Bool?
    let rate : String?
    let verified : Bool?
    let distance : Int?
}
