//

//  AddDishImage+Model.swift
//  ChefApp
//
//  Created by Admin on 9/29/19.
//  Copyright © 2019 All rights reserved.
//

struct AllAddDishImageResponseData: Codable {
    let status_code : Int?
    let message : String?
    let data : UserDetailsAddDishImageData?
}

struct UserDetailsAddDishImageData : Codable{
    
    let dish: DishDataArray?
    let photos : [DishPhotosDataArray]?
    
}
struct DishPhotosDataArray : Codable {
    let id : Int?
    let url : String?
}
