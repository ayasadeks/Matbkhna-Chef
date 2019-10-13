
//  WorkingHours_Model.Swift
//  ChefApp
//
//  Created by Admin on 9/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//
//

struct AllWorkingHoursResponseData : Codable{
    let status_code : Int?
    let message : String?
    let data: [WorkingHouresDataArray]?
    
}
struct WorkingHouresDataArray : Codable{
    let id : Int?
    let open : String?
    let close : String?
    let day : String?
}
