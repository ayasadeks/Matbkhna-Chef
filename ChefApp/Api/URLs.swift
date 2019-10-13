//
//  URLs.swift
//  ChefApp
//
//  Created by Admin on 9/17/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
struct URLS {
//  MAIN URL
        static let main = "http://mobileaders.com/mtbkhna/public/api/"
    
        //  POST
        static let login = main + "users/login"
        // post
        static let register = main + "users/register"
        //resend code
        static let askVerficationCode = main + "users/sendVerification"
            //send code
        static let sendVerficationCode = main + "users/verify"
    
        static let changePassword = main + "users/updatePassword"

         //to add dish
        static let addDish = main + "dishes/add"

                ///POST(TO SET DISHES PHOTOS)
        static let addDishesPhoto = main + "dishes/addPhotos/"
    
        ///POST(TO SET WORK TIME)
        static let setWorkTime = main + "users/setWorkHours"
    
        static let country = main + "countries"

    
         static let getOrder = main + "orders/get"
    
         static let getResturant = main + "users/get"
    
        ///GET(TO Get DISHES)
        static let getDish = main + "dishes/get"
    
        ///GET(TO GET USER WORK HOURS)
        static let getWorkHour = main + "users/"
    
    
    

}
//   /{user}/getWorkHours
