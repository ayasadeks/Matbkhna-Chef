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
//extension API{
//    class func GetAllDishesData(api_token: Int ,id : Int = 1,completion: @escaping (_ sucess : Bool?, _ arrayData: [DishDataArray]?, _ total_pages : Int? ) -> Void){
//        
//        let url = URLS.getDish
//        //  dishes/get?id=51&userId=206&photos=1&extras=1
//        print("url\(url)")
//        let parameters = [
//            "userId" : api_token,
//            "id" : id
//            ] as [String : Any]
//        API.showSVProgress()
//        let decoder = JSONDecoder()
//        Alamofire.request(url,method: .get , parameters: parameters).responseDecodableObject(decoder: decoder) { (response: DataResponse<AllDishResponseData> ) in
//            print("dishessssss\(response)")
//            let responseStatus = response.result
//            print("responseStatus\(responseStatus)")
//            ///ResponseStatus check there is connection or not
//            ///SUCCESS--> there is connection
//            ///FAILOUR--> there is no connection
//            if "\(responseStatus)" == "SUCCESS"{
//                print("there is connection")
//                let responseValue = response.result.value
//                let repo = response.result.value
//                //print("repo\(repo?.data)")
//                let arrayData = repo?.data
//               // let totalPages = repo?.paginate!.total_pages
//                API.dismissSVProgress()
//                completion(true , arrayData, totalPages! )
//            }else{
//                print("there is no connection")
//                completion(false,nil,nil)
//                
//            }
//        }//end of alamofire
//    }//end of class function
//}//end of extension
