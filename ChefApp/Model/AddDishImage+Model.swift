//
//  AddDishImage+Model.swift
//  Mtbkhna_Cooker
//
//  Created by apple on 6/14/19.
//  Copyright © 2019 Mobileaders. All rights reserved.
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
