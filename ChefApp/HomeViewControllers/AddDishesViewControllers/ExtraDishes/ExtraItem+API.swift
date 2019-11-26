//
//  ExtraItem+API.swift
//  ChefApp
//
//  Created by Admin on 10/16/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import CodableAlamofire
import Alamofire

extension API {
    class func AddDishExtra(title: String , titleEng: String , completion: @escaping (_ sucess: Bool? ) -> Void){
        
        let url = URLS.addDishesExetra
        print(url)
         let api_token = "UzJMtttbYhAbfsD4GbChQjtf4KgYQPTPCSUKESBGgcGCQnCQ0zS5PTU6oQSwlmZDSoso9EBmNa5cklmAwIn5i8X9Ftw1Hnk9UuQsS1pGAU8wZWs7dPA3IsGFx4KTZNlSyKNN0AouUzruj2QTMFA73H"
            //UserDefaultData.get_user_string_data(key: "userToken")  else{return}
        print("api_token\(api_token)")
        
        let parameters = [
            "title" : title,
            "titleEng" : titleEng,
            "api_token": api_token
            ] as [String : Any] 
        
        API.showSVProgress()
        let decoder = JSONDecoder()
        Alamofire.request(url,method: .post , parameters: parameters).responseDecodableObject(decoder: decoder) { (response: DataResponse<AllAddDishExtraResponseData> ) in
            print("\(response)")
            let responseStatus = response.result
            print("responseStatus \(responseStatus)")
            ///ResponseStatus check there is connection or not
            ///SUCCESS--> there is connection
            ///FAILOUR--> there is no connection
            if "\(responseStatus)" == "SUCCESS"{
                print("there is connection")
                let repo = response.result.value
                //print("repo\(repo?.data)")
                if repo?.status_code == 200{
                    let dishData = repo?.data
                    print("status code == 200")
                    
                    API.dismissSVProgress()
                    completion(true)
                }else{
                    API.dismissSVProgress()
                    completion(false)
                }
                
            }else{
                print("there is no connection")
                API.dismissSVProgress()
                completion(false)
                
            }
        }//end of alamofire
    }//end of class function
}//end of extension
