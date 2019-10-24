//////
//////  SearchAreaAPI.swift
//////  ChefApp
//////
//////  Created by Admin on 10/21/19.
//////  Copyright © 2019 Admin. All rights reserved.
//////
////
//import Foundation
//import Alamofire
//extension API {
//    class func GetCountry(page : Int = 1, searchKey: String ,completion: @escaping (_ sucess: Bool?, _ arrayData: [AreaArrayData]?, _ total_pages : Int ) -> Void){
//
//
//        let url = URLS.country
//        let parameters = [
//            "page": page
//            ] as [String : Any]
//        API.showSVProgress()
//        let decoder = JSONDecoder()
//        Alamofire.request(url,method: .get , parameters: parameters).responseDecodableObject(decoder: decoder) { (response: DataResponse<AllResponseData> ) in
//            let responseStatus = response.result
//            print("responseStatus\(responseStatus)")
//
//            if "\(responseStatus)" == "SUCCESS"{
//                print("there is connection")
//                let responseValue = response.result.value
//                let repo = response.result.value
//                //print("repo\(repo?.data)")
//                let arrayData = repo?.data
//                let totalPages = repo?.paginate!.total_pages
//                API.dismissSVProgress()
//                completion(nil , arrayData, totalPages!)
//            }else{
//                print("there is no connection")
//                completion(nil,nil,0)
//
//            }
//        }//end of alamofire
//    }//end of class function
//}//end of extension
