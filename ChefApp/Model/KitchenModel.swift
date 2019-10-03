//
//  KitchenModel.swift
//  Mtbakhna
//
//  Created by Rania on 8/31/19.
//  Copyright © 2019 Rania. All rights reserved.
//
struct AllKitchenResponseData: Codable {
    let imageUrl : String?
    let data: [KitchenDataArray]?
    let paginate: [kitchenPaginate]?
    let status_code : Int?
}

struct KitchenDataArray : Codable{
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
struct kitchenPaginate : Codable {
    let total_count: Int?
    let total_pages: Int?
    let current_page: Int?
    let limit : Int?
}

