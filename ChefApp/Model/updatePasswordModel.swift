//
//  updatePasswordModel.swift
//  ChefApp
//
//  Created by Admin on 11/6/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct AllUpdatePassResponseData : Codable{
    let status_code : Int?
    let status_message : String?
    let data : UpdatePasswordData?
}

struct UpdatePasswordData : Codable {
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
    let lastLoginAt : Int?
}
