//
//  GetAreaNamesAPI.swift
//  ChefApp
//
//  Created by Admin on 10/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

import CodableAlamofire
import Alamofire
extension API {
    class func Country(page : Int = 1 ,key : String,countryId : Int?, completion: @escaping (_ sucess: Bool, _ arrayData: [AreaArrayData]?, _ total_pages : Int ) -> Void){
        
        let url = URLS.country
        var parameters = [
            "page" : page
            ] as! [String : Any]
        if keyFlag == "country"{
            parameters = [
                "page" : page
            ]
        }else if keyFlag == "countryKey"{
            parameters = [
                "page" : page,
                "keyword" : key
            ]

        }else if keyFlag == "city"{
            parameters = [
                "page" : page,
                "parentId" : countryId
            ]

        }else if keyFlag == "countryKey"{
            parameters = [
                "page" : page,
                "keyword" : key,
                "parentId" : countryId
            ]

        }
        
        API.showSVProgress()
        let decoder = JSONDecoder()
        Alamofire.request(url,method: .get , parameters: parameters).responseDecodableObject(decoder: decoder) { (response: DataResponse<AllResponseData> ) in
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
                    let totalPages = repo?.paginate!.total_pages
                    API.dismissSVProgress()
                    completion(true , arrayData, totalPages!)
                }else{
                    API.dismissSVProgress()
                    completion(true , nil, 0)
                }
                
            }else{
                print("there is no connection")
                API.dismissSVProgress()
                completion(false,nil,0)
                
            }
        }//end of alamofire
    }//end of class function
}//end of extension
