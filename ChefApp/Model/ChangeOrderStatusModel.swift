//
//  ChangeOrderStatusModel.swift
//  ChefApp
//
//  Created by Admin on 10/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct AllChangeOrderStatusResponseData : Codable{
    let data: ChangeOrderStatusData?
    let status_code : Int?
}
struct ChangeOrderStatusData : Codable{
    let id : Int?
    let user_id: Int?
    let seller_id : Int?
    let price : String?
    let extra_price : String?
    let total_price : String?
    let status : String?
    let created_at : String?
    let updated_at : String?
    let address_id : String?
    let delivery_id : String?
    
}
