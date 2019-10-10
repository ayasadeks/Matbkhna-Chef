//
//  AddDishesModel.swift
//  ChefApp
//
//  Created by Admin on 10/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct AllDishData : Codable{
    let message : String?
   // let imageUrl : String?
    let data: [DishDataArray]?
    let status_code : Int?
    let status_message : String?
   // let paginate : dishPaginate?
}
