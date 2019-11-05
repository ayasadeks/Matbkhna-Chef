//
//  UserDefaultData.swift
//  ChefApp
//
//  Created by Admin on 9/18/19.
//  Copyright © 2019 Admin. All rights reserved.
//


import UIKit

class UserDefaultData: NSObject {

    
    class func save_user_data(token: String?, id: Int? ,name: String? ,email: String? ,phone: String? , is_active: Bool? ){
        let def = UserDefaults.standard
        def.set(token, forKey: "userToken")
        def.set(id, forKey: "userid")
        def.set(name, forKey: "username")
        def.set(email, forKey: "useremail")
        def.set(phone, forKey: "userphone")
        def.set(is_active, forKey: "is_active")
//        def.set(image, forKey: "image")
//        def.set(lat, forKey: "lat")
//        def.set(long, forKey: "long")
       // def.set(password, forKey: "password")

        def.synchronize()
    }

    
    class func save_user_update_data(token: String?, id: Int? ,name: String? ,email: String? ,phone: String? , is_active: Bool? , image: String? , lat  : Int? , long : Int?){
        let def = UserDefaults.standard
        def.set(token, forKey: "userToken")
        def.set(id, forKey: "userid")
        def.set(name, forKey: "username")
        def.set(email, forKey: "useremail")
        def.set(phone, forKey: "userphone")
        def.set(is_active, forKey: "is_active")
        def.set(image, forKey: "image")
        def.set(lat, forKey: "lat")
        def.set(long, forKey: "long")
        def.synchronize()
    }
    class func saveLatAndLong(lat : String? , long : String?){
        let def = UserDefaults.standard
        def.set(lat, forKey: "lat")
        def.set(long, forKey: "long")
        def.synchronize()
        
    }
    class func saveIsActive(isActive : Bool?){
        let def = UserDefaults.standard
        def.set(isActive, forKey: "activeStatus")
    }
    class func get_user_string_data(key: String)->String? {
        let def = UserDefaults.standard
        return def.object(forKey: key) as? String
    }
    class func get_user_Int_data(key: String)->Int? {
        let def = UserDefaults.standard
        return def.object(forKey: key) as? Int
    }
    class func delete_user_Token(key: String){
        let def = UserDefaults.standard
        def.removeObject(forKey: key)
        
    }
    
    class func save_user_password( password: String ){
        let def = UserDefaults.standard
        def.set(password, forKey: "password")
        def.synchronize()
    }
    
    class func getStartPoint()->Bool?{
        let def = UserDefaults.standard
        return def.object(forKey: "home") as? Bool
    }
    class func save_start_point(start: Bool? ){
        let def = UserDefaults.standard
        def.set(start, forKey: "home")
        def.synchronize()
    }
}

