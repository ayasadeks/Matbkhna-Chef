////
////  API+GetDishesData.swift
////  Mtbkhna_Cooker
////
////  Created by apple on 6/15/19.
////  Copyright © 2019 Mobileaders. All rights reserved.
////
//
//import CodableAlamofire
//import Alamofire
//
//extension OrderViewController{
//    class func GetAllOrderData(api_token : String, page : Int = 1 ,completion: @escaping (_ sucess : Bool?, _ arrayData: [OrderDataArray]?, _ total_pages : Int? ) -> Void){
//        
//        let url = URLS.getOrder
//        let parameters = [
//            "api_token" : api_token
//            ] as [String : Any]
//        API.showSVProgress()
//        let decoder = JSONDecoder()
//     
//        Alamofire.request(url,method: .get , parameters: parameters).responseDecodableObject(decoder: decoder) { (response: DataResponse<AllOrderResponseData> ) in
//            print("dishessssss\(response)")
//            print(response.result)
//            let responseStatus = response.result
//            print("responseStatus\(responseStatus)")
//            ///ResponseStatus check there is connection or not
//            ///SUCCESS--> there is connection
//            ///FAILOUR--> there is no connection
//            if "\(responseStatus)" == "SUCCESS"{
//                print("there is connection")
//                let responseValue = response.result.value
//                // let repo = response.result.value
//                print("data is \(responseValue?.data)")
//                let arrayData = responseValue?.data
//                let totalPages = responseValue?.paginate?.count
//                print("total pages >>  \(totalPages)")
//                API.dismissSVProgress()
//                completion(true, arrayData, totalPages)
//            }else{
//                print("there is no connection response fail")
//                completion(false,nil,nil)
//        
//            }
//            }
//
//    
//    }
//}//end of extension
//
//
//
//
//
//
//
//
//
//
//
