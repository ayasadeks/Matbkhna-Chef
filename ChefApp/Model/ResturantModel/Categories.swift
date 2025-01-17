//
//  Categories.swift
//  ChefApp
//
//  Created by Admin on 10/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct AllCategoryResponseData : Codable{
    let imageUrl : String?
    let data : [CategoryData]?
    let paginate : CategoryPaginate?
    let status_code : Int?
    let status_message : String?
    
}
struct CategoryData : Codable {
        let id : Int?
        let title : String?
        let titleEng : String?
        let image : String?
}
struct CategoryPaginate : Codable {
    let total_pages : Int?
    let current_page: Int?
    let total_count : Int?
    let limit : Int?
}



