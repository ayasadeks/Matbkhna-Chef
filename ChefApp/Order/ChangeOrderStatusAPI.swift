//
//  ChangeOrderStatusAPI.swift
//  ChefApp
//
//  Created by Admin on 10/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import CodableAlamofire
import Alamofire
extension API {
    class func ChangeOrderStatus(orderId : Int,completion:  @escaping ( _ success: Bool) -> Void){
        
        
        let url = URLS.changeOrderStatus
        print("\(url)")
        
        let userToken = UserDefaultData.get_user_string_data(key: "userToken")
        print("userToken\(userToken)")
        let parameters = [
            "orderId" : orderId,
            "status" : 2,
            "api_token" : userToken!
            ] as [String : Any]
        API.showSVProgress()
        let decoder = JSONDecoder()
        
        Alamofire.request(url,method: .post , parameters: parameters).responseDecodableObject(decoder: decoder) { (response: DataResponse<AllChangeOrderStatusResponseData> ) in
            print("order\(response)")
            let responseStatus = response.result
            print("responseStatus\(responseStatus)")
            ///ResponseStatus check there is connection or not
            ///SUCCESS--> there is connection
            ///FAILOUR--> there is no connection
            if "\(responseStatus)" == "SUCCESS"{
                print("there is connection")
                let responseValue = response.result.value
                let data = responseValue?.data
                let statusCode = responseValue?.status_code
                
                if statusCode == 200{
                    API.dismissSVProgress()
                    
                    completion(true)
                }else{
                    API.dismissSVProgress()
                    completion(false)
                    
                }
                //completion(true,dishes,totalPages!,price!)
                
            }else{
                print("there is no connection")
                API.dismissSVProgress()
                completion(false)
                
            }
            
            
        }//end of alamofire
    }//end of class function
}//end of extension
