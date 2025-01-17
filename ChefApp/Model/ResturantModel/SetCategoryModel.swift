//
//  SetCategoryModel.swift
//  ChefApp
//
//  Created by Admin on 11/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


struct SetCategoryDataModel : Codable{
    let userDetails : UserDetailsSetCategoryData?
    let categories : [CategoriesSets]?
}
struct UserDetailsSetCategoryData : Codable{
    
    let id: Int?
    let name : String?
    let email : String?
    let phone : String?
    let logo : String?
    let cover: String?
    let description : String?
    let cityId : Int?
    let latitude : Int?
    let longitude : Int?
    let openStatus : Bool?
    let rate : String?
    let verified : Bool?
    let distance : Int?
}
struct CategoriesSets : Codable{
    let id : Int?
    let title : String?
    let titleEng : String?
    let image : String?
}
//struct RegisterErrors : Codable{
//    let phone: [String]?
//    let email : [String]?
//}
struct AllSetCategoryResponseData: Codable {
    let status_code : Int?
    let message : String?
    let data : SetCategoryDataModel?
    let paginate : CategoryPaginate?

}

