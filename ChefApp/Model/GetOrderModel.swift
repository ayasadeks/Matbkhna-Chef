//
//  GetOrderModel.swift
//  ChefApp
//
//  Created by Admin on 10/1/19.
//  Copyright © 2019 Admin. All rights reserved.
//

struct AllOrderResponseData : Codable {
    let data : [OrderDataArray]?
    let paginate : OrderPaginate?
    let status_code : Int?
    let status_message : String?
}

struct OrderDataArray : Codable {
    let id : Int?
    let status : String?
    let seller_id : Int?
    let price : String?
    let extraPrice   : String?
    let totalPrice : String?
    let createdAt : String?
    let updatedAt : String?
    let dishes: [DishesPhotos]?

}

struct OrderPaginate : Codable {
   let total_count: Int?
   let total_pages: Int?
   let current_page: Int?
   let limit : Int?
}

//struct AllDishesData : Codable {
//    let id : Int?
//    let size : String?
//    let price : String?
//    let quantity : Int?
//    let extraPrice : String?
//    let totalPrice : String?
//    let details : [DishDataArray]?
//    let photos: [DishesPhotos]?
//    let extra : [DishesExtras]?
//
//  
//}
