//
//  Category+API.swift
//  ChefApp
//
//  Created by Admin on 10/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

import CodableAlamofire
import Alamofire
extension API {
    class func SetCategory(categories : [Int]? ,completion: @escaping (_ sucess: Bool? ) -> Void){
        
        let url = URLS.setCategory
        guard let api_token = UserDefaultData.get_user_string_data(key: "userToken")  else{return}
        print("categories \(categories!.count) api_token\(api_token)")
        var parameters = [
            //"categories[0]" : 1,
            "categories" : categories!,
            "api_token" : api_token
            ] as [String : Any] 
        
        for (index, element) in categories!.enumerated() {
            parameters["categories[\(index)]"] = element
            print("Item \(index): \(element)")
        }
        for (index, element) in parameters.enumerated() {
            
            print("PP \(index): \(element)")
        }
        
        API.showSVProgress()
        let decoder = JSONDecoder()
        Alamofire.request(url,method: .post , parameters: parameters).responseDecodableObject(decoder: decoder) { (response: DataResponse<AllSetCategoryResponseData> ) in
            let responseStatus = response.result
            print("responseStatus\(responseStatus)")
            ///ResponseStatus check there is connection or not
            ///SUCCESS--> there is connection
            ///FAILOUR--> there is no connection
            if "\(responseStatus)" == "SUCCESS"{
                print("there is connection")
                let repo = response.result.value
                //print("repo\(repo?.data)")
                if repo?.status_code == 200{
                    let arrayData = repo?.data
                    // let totalPages = repo?.paginate!.total_pages
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
