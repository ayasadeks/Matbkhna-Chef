//
//  Dishes_Model.swift
//  Mtbakhna
//
//  Created by Admin on 9/14/19.
//  Copyright © 2019 All rights reserved.
//

struct AllDishResponseData : Codable{
    let message : String?
    let imageUrl : String?
    let data: [DishDataArray]?
    let status_code : Int?
    let status_message : String?
    let paginate : dishPaginate?
}
struct DishDataArray : Codable{
    let id : Int?
    let title : String?
    let titleEng : String?
    let descriptionEng : String?
    let description : String?
    let smallPrice : String?
    let mediumPrice : String?
    let largePrice : String?
    let photos: [DishesPhotos]?
    let extras : [DishesExtras]?
}
struct DishesPhotos: Codable {
    let id : Int?
    let url : String?
}
struct dishPaginate : Codable {
    let total_count: Int?
    let total_pages: Int?
    let current_page: Int?
    let limit : Int?
}
struct DishesExtras : Codable {
    let id : Int?
    let title : String?
    let titleEng : String?
    let smallPrice : String?
    let mediumPrice : String?
    let largePrice : String?
    let image : String?
}
