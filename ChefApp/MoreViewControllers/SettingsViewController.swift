//
//  SettingsViewController.swift
//  ChefApp
//
//  Created by Admin on 9/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import CodableAlamofire
import Alamofire

class SettingsViewController: UIViewController {

    
    @IBAction func switchAction(_ sender: UISwitch) {
        if (sender.isOn == true){
            print("switch is ON")
        }else{
            print("switch is Off")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
         }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)

    }
    @IBAction func changePasswordVC(_ sender: UIButton) {
        
        print("go change password")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "newPassword") as! NewPasswordViewController
        self.present(nextViewController, animated:false, completion:nil)
        
    }
    
    @IBAction func logOutButton(_ sender: UIButton) {
        let userToke = UserDefaultData.get_user_string_data(key: "userToken")
        if userToke == nil{
            self.showToast(message: "you are not autherized")
            
        }else{
            API.LogOut { (sucess, message) in
                if sucess{
                    self.showToast(message: "Logout Sucess")
                    UserDefaultData.delete_user_Token(key: "userToken")
                    UserDefaultData.delete_user_Token(key: "userid")
                    UserDefaultData.delete_user_Token(key: "username")
                    UserDefaultData.delete_user_Token(key: "useremail")
                    UserDefaultData.delete_user_Token(key: "userphone")
                    
                }else{
                    self.showToast(message: message)
                    
                }
            }
        }
    }
    
   

}



extension API {
    class func LogOut(completion:  @escaping ( _ success: Bool , _ errorMessage: String) -> Void){
        
        
        let url = URLS.logOut
        var api_token = UserDefaultData.get_user_string_data(key: "userToken")
        print("userToke\(api_token)")
        let parameters = [
            "api_token" : api_token!
            
            ] as [String : Any]
        API.showSVProgress()
        let decoder = JSONDecoder()
        
        Alamofire.request(url,method: .post , parameters: parameters).responseDecodableObject(decoder: decoder) { (response: DataResponse<AllLogOutResponseData> ) in
            let responseStatus = response.result
            print("responseStatus\(responseStatus)")
            ///ResponseStatus check there is connection or not
            ///SUCCESS--> there is connection
            ///FAILOUR--> there is no connection
            if "\(responseStatus)" == "SUCCESS"{
                print("there is connection")
                let responseValue = response.result.value
                if responseValue?.status_code != 200{
                    print("there is errors")
                    let ErrorMessage = responseValue?.message
                    print("ErrorMessage\(ErrorMessage)")
                    API.dismissSVProgress()
                    completion( true, ErrorMessage!)
                    
                }else{
                    print("there is no errors")
                    API.dismissSVProgress()
                    completion( true, "noError")
                }
                
            }else{
                print("there is no connection")
                completion(false,"nil")
                
            }
            
            
        }//end of alamofire
    }//end of class function
}//end of extension

