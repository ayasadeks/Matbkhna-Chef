//
//  GetExtraDishes.swift
//  ChefApp
//
//  Created by Admin on 10/17/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct AllGetExtraResponseData : Codable {
    let data : [ExtraItemData]?
    let paginate : ExtraPaginate?
    let status_code : Int?
    let status_message : String?
}
struct ExtraPaginate : Codable {
    let total_count: Int?
    let total_pages: Int?
    let current_page: Int?
    let limit : Int?
}

struct ExtraItemData : Codable {
    let id: Int?
    let title : String?
    let titleEng : String?
    let smallPrice : String?
    let mediumPrice : String?
    let largePrice : String?
    let image : String?
    
}
