//
//  SetWorkingTimeApi.swift
//  ChefApp
//
//  Created by Admin on 10/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import CodableAlamofire
import Alamofire
extension API {
    class func SetWorkTime(open: String , close: String , day : Int ,completion: @escaping (_ sucess: Bool? ) -> Void){
        
        let url = URLS.setWorkTime
        print(url)
        
        guard let api_token = UserDefaultData.get_user_string_data(key: "userToken")  else{return}
        print("api_token\(api_token)")
        let workHours = "[{\"open\":\"\(open)\"," + "\"close\":\"\(close)\"," + "\"day\":\"\(day)\"" + "}]"
        print("yy\(workHours)")
        let parameters = [
            "workHours" : workHours,
            "api_token": api_token
            ] as! [String : Any]
        for i in parameters{
            print("i\(i)")
        }
        
        API.showSVProgress()
        let decoder = JSONDecoder()
        Alamofire.request(url,method: .post , parameters: parameters).responseDecodableObject(decoder: decoder) { (response: DataResponse<AllSetWorkTimeResponseData> ) in
            print("\(response)")
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
