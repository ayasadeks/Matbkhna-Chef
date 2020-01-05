//
//  LoginModel.swift
//  ChefApp
//
//  Created by Admin on 9/17/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation



struct  AllLoginResponseData: Codable {
    let status_code : Int?
    let data : LoginDataModel?
    let token : String?
    let status_message : String?
}

struct LoginDataModel : Codable{
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
