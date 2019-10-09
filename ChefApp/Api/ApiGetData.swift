//
//  ApiGetData.swift
//  ChefApp
//
//  Created by Admin on 9/17/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Alamofire

extension API {


    class func GetData<T: Codable>(_ decoderr: T.Type,language : String ,url : String ,method: HTTPMethod , parameters: [String : Any]?, userToken : String? ,completion: @escaping (ServerResponse<T>) -> Void){

        API.showSVProgress()

      // let decoder = JSONDecoder()
        Alamofire.request(url, method: method , parameters: parameters , headers: nil).responseData { (response) in
            print(response)
            let responseStatus = response.result
            print(responseStatus)
            let responseValue = response.result.value
            print("responseValue \(String(describing: responseValue))")

            //error response
            guard let data = response.result.value else {
                API.dismissSVProgress()
                completion(ServerResponse<T>.noConnection("There Is No Connection"))
              //  print(response.data)
                return
            }
            do {
                let decoder = JSONDecoder()
                let modules = try decoder.decode(decoderr, from: data)
                API.dismissSVProgress()
                print("donne codable")
                completion(ServerResponse<T>.success(modules))
            }catch {
                print("catch >>>>")
                API.dismissSVProgress()
                print("error server")
                completion(ServerResponse<T>.failure(error))
            }
        }//end of alamofire
    }//end of class function
    enum ServerResponse<T> {
        case success(T), failure(Error?) , noConnection(String?)

    }

}//end of extension




////variable from Login Model
//private var loginResponse:Login?
//
//func loginRequest(phone: String, completion: @escaping ( _ success: Bool)-> Void) {
//    let url = URL(string: "https://dndoon-api.herokuapp.com/api/v1/clients/login")
//    let parameters = ["phone" : phone]
//    let headers = ["Authorization" : "d53101f4f9a32aac0651657c522d90e8"]
//    Alamofire.request(url!, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
//        print(response)
//        if response.result.error == nil {
//            guard let data = response.data else {return}
//            do{
//                let decoder = JSONDecoder()
//                let userlogin = try decoder.decode(Login.self, from: data)
//                print(userlogin.status!)
//                self.loginResponse = userlogin
//            }catch{
//                print(error.localizedDescription)
//            }
//            completion(true)
//        }else{
//            completion(false)
//            debugPrint("Post Login Request Error\t" , response.result.error as Any)
//        }
//    }
//}
//func getLoginResponse()->Login{
//    return loginResponse!
//}
