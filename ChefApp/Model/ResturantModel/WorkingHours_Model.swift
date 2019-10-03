//
//  WorkingHours_Model.swift
//  Mtbkhna_Cooker
//
//  Created by apple on 6/15/19.
//  Copyright © 2019 Mobileaders. All rights reserved.
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
