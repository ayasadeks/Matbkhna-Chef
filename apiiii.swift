//
//  apiiii.swift
//  ChefApp
//
//  Created by Admin on 9/22/19.
//  Copyright © 2019 Admin. All rights reserved.
//


import Foundation
import Alamofire

class FRAddHallReservation {
    
    static let instance = FRAddHallReservation()
    
    private var receiveResponse : HallReservation?
    
    func addHallRecervation( date : String , hallID :Int, paymentID :Any ,copounID :Int? , notes :String , paidService :[Int] ,completion : @escaping completionHandler){
        
        
        
        let body : [String : Any] = ["token": SaveUserDefault.getUserToken()!,
                                     "date": date , "hall_id" : hallID , "payment_id": paymentID , "coupon_id" : copounID ?? ""  , "notes" : notes, "additional_services": paidService]
        print(body)
        
        Alamofire.request(ADD_HALL_RESERVATION_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else {return}
                do{
                    let decoder = JSONDecoder()
                    let downloadData = try decoder.decode(HallReservation.self, from: data)
                    print("Seccuess")
                    self.receiveResponse = downloadData
                    print(downloadData.success)
                }catch let error  {
                    print(error.localizedDescription)
                }
                
                completion(true)
            }else{
                completion(false)
                debugPrint("Post Add Hall Reservations Request Error\t" , response.result.error as Any)
            }
        }
        
        
    }
    
    // Get Object of response
    func getReceiveResponse () -> HallReservation{
        return receiveResponse!
    }
    
    
}
