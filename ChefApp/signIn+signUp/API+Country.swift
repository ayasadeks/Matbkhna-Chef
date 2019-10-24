//
//  API+Country.swift
//  Mtbkhna
//
//  Created by Macbook on 3/11/19.
//  Copyright © 2019 Mobileaders. All rights reserved.
//
import CodableAlamofire
import Alamofire

extension API {
    class func Country(page : Int = 1 ,completion: @escaping (_ error: Error?, _ arrayData: [AreaArrayData]?, _ total_pages : Int ) -> Void){
        
        
        let url = URLS.country
            let parameters = [
                "page" : page
            ]
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
                let responseValue = response.result.value
                let repo = response.result.value
                print("repo\(repo?.data)")
                let arrayData = repo?.data
                let totalPages = repo?.paginate!.total_pages
                API.dismissSVProgress()
                completion(nil , arrayData, totalPages!)
            }else{
                print("there is no connection")
                completion(nil,nil,0)
                
            }
                }//end of alamofire
    }//end of class function
}//end of extension
