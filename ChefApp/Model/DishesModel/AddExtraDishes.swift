//
//  AddExtraDishes.swift
//  ChefApp
//
//  Created by Admin on 10/16/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct AllAddDishExtraResponseData: Codable {
    let status_code : Int?
    let message : String?
    let data : AddDishExtraData?
    let status_message : String?
}

struct AddDishExtraData : Codable{
    
    let id: Int?
    let title : String?
    let titleEng : String?
    let smallPrice : String?
    let mediumPrice : String?
    let largePrice : String?
    let image : String?
    
}
