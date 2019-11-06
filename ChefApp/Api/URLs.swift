//
//  URLs.swift
//  ChefApp
//
//  Created by Admin on 9/17/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
struct URLS {
        // MAIN URL
        static let main = "http://mobileaders.com/mtbkhna/public/api/"
    
        //  POST Login
        static let login = main + "users/login"
        // post Register
        static let register = main + "users/register"
        //resend code
        static let askVerficationCode = main + "users/sendVerification"
        //send code
        static let sendVerficationCode = main + "users/verify"
         // Forget password POST
        static let forgetPassword = main + "users/forget_password"
        // reset password  POST
        static let resetPassword = main + "users/verify_reset_password"
        //to add dish  POST
        static let addDish = main + "dishes/add"
        ///POST(TO SET DISHES PHOTOS)
        static let addDishesPhoto = main + "dishes/addPhotos/"
        ///POST(TO SET WORK TIME)
        static let setWorkTime = main + "users/setWorkHours"
         ///GET contries
        static let country = main + "countries"
         //GET Orders
         static let getOrder = main + "orders/get"
          // GET Resturant Details
         static let getResturant = main + "users/get"
        ///GET(TO Get DISHES)
        static let getDish = main + "dishes/get"
        ///GET(TO GET USER WORK HOURS)
        static let getWorkHour = main + "users/"
        ///POST(TO SET DISHES EXETRAS)
        static let addDishesExetra = main + "extras/add"
        //GET to get extra items
        static let getExtraItems = main + "extras/get"
        // change order status
        static let changeOrderStatus = main + "orders/changeStatus"
        ///GET(TO GET CATEGORY)
        static let getCategory = main + "categories"
        ///POST(TO Post user update)
        static let userUpdate = main + "users/update"
    
    ///POST(TO LOGOUT)
    static let logOut = main + "users/logout"
     ///POST(TO update password)
    static let updatePassword = main + "users/updatePassword"
    
    

}
//   /{user}/getWorkHours
