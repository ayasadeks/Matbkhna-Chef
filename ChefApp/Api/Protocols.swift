//
//  Protocols.swift
//  ChefApp
//
//  Created by Admin on 10/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

import UIKit
protocol sendCountryId {
    func sendCountryId_Name(CountryId: Int , CountryName : String)
}

protocol sentCategoryId {
    func setCategoryIdFunc(categoryID: Int)
}
