//
//  RegisterModel.swift
//  ChefApp
//
//  Created by Admin on 9/17/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


struct RegisterDataModel : Codable{
    let id: Int?
    let name : String?
    let email : String?
    let phone : String?
    let logo : String?
    let cover: String?
    let description : String?
    let cityId : String?
    let latitude : Int?
    let longitude : Int?
    let openStatus : Bool?
    let rate : String?
    let verified : Bool?
    let distance : Int?
}
struct RegisterErrors : Codable{
    let phone: [String]?
    let email : [String]?
}
struct AllRegisterResponseData: Codable {
    let status_code : Int?
    let errors : RegisterErrors?
    let status_message : String?
    let data : RegisterDataModel?
    let token : String?
    let user_type : Int?
    let verification_status: Bool?
    let message : String?
}

