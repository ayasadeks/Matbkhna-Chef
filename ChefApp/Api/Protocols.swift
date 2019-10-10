//
//  Protocols.swift
//  ChefApp
//
//  Created by Admin on 10/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

import UIKit
protocol setCityAndCountryNameDelegate {
    func setCityAndCountryNameFunc(cityName: String , countryName: String , locationID: Int)
}
protocol passCityNameTofirstView {
    func passCityNameTofirstViewFunc(cityName: String , countryName: String , LocatioID : Int)
}
