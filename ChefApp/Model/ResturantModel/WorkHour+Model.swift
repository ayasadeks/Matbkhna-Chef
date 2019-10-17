//
//
//  WorkHour+Model.Swift
//  ChefApp
//
//  Created by Admin on 9/29/19.
//  Copyright © 2019 Admin. All rights reserved.
//


struct AllSetWorkTimeResponseData: Codable {
    let status_code : Int?
    let message : String?
    let data : SetWorkHourDataModel?
}
struct SetWorkHourDataModel : Codable{
    let userDetails : UserDetailsSetWorkTimeData?
    let workHours : [WorkTimeArray]?
}
struct UserDetailsSetWorkTimeData : Codable{
    
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
struct WorkTimeArray : Codable{
    let id : Int?
    let open : String?
    let close : String?
    let day : String?
}



