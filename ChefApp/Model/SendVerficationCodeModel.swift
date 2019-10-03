//
//  SendVerficationCodeModel.swift
//  ChefApp
//
//  Created by Admin on 9/18/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

//to verify account
struct AllSendVerficationCode : Codable {
    let status_code : Int?
    let message : String?
    let data : ChangePasswordDataModel?
}
