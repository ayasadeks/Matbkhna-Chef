//
//  resturantDetailes_Model.Swift
//  ChefApp
//
//  Created by Admin on 9/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//


struct AllResturantsDetailesResponseData: Codable {
    let imageUrl : String?
    let data: [ResturantsDetailesDataArrayModel]?
    let paginate: ResturantPaginate?
    let status_code : Int?
}


struct ResturantsDetailesDataArrayModel : Codable{
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
struct ResturantPaginate : Codable {
    let total_pages : Int?
    let current_page: Int?
    let total_count : Int?
    let limit : Int?
}
