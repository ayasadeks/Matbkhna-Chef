//
//  ExtensionApi.swift
//  ChefApp
//
//  Created by Admin on 9/22/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import Alamofire

extension API{
static let instance = API()

//variable from Login Model

func loginRequest(phone: String , password:String, completion: @escaping ( _ success: Bool)-> Void) {
    var loginResponse:AllLoginResponseData?

    let url = URLS.login
    let parameters = ["username" : phone,"password" : password]
    Alamofire.request(url , method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
        print(response)
        if response.result.error == nil {
            guard let data = response.data else {return}
            do{
                let decoder = JSONDecoder()
                let userlogin = try decoder.decode(AllLoginResponseData.self, from: data)
                print(userlogin.status_code!)
                loginResponse = userlogin
            }catch{
                print(error.localizedDescription)
            }
            completion(true)
        }else{
            completion(false)
            debugPrint("Post Login Request Error\t" , response.result.error as Any)
        }
    }
}
    
func getLoginResponse()->AllLoginResponseData{
    var loginResponse:AllLoginResponseData?

    return loginResponse!
}
}
