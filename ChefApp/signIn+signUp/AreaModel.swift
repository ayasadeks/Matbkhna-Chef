//
//  AreaModel.swift
//  ChefApp
//
//  Created by Admin on 10/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct AllResponseData : Codable{
    let data: [AreaArrayData]?
    let paginate: Paginate?
    let status_code : Int?
    let status_message : String?
}

struct AreaArrayData: Codable {
    let id : Int?
    let title : String?
    let titleEng : String?
    
}
struct Paginate : Codable {
    let total_pages : Int?
    let current_page: Int?
    let total_count : Int?
    let limit : Int?
    
}

