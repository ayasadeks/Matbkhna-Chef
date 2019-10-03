//
//  ViewController.swift
//  ChefApp
//
//  Created by Admin on 9/16/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import IQKeyboardManagerSwift
import Alamofire
import CodableAlamofire

class signInViewController: UIViewController {
    
    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var showPassOutlet: UIButton!
    @IBOutlet weak var forgetPassOutlet: UIButton!
    @IBOutlet weak var dontHaveAccLabel: UILabel!
    @IBOutlet weak var signInOutlet: UIButton!
    @IBOutlet weak var signUpOutlet: UIButton!
    
    var code : String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
      Localize()
        signUpOutlet.layer.applySketchShadow(color: .black, alpha: 0.06, x: 0, y: 5, blur: 4, spread: 0)
        signInOutlet.layer.applySketchShadow(color: .black, alpha: 0.06, x: 0, y: 5, blur: 4, spread: 0)
        
    }
   
    @IBAction func forgetPassButton(_ sender: Any) {
        //go to next view controller
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "changePassword") as! ChangePasswordViewController
        self.present(nextViewController, animated: true, completion: nil)
    }
    

    @IBAction func signInButton(_ sender: Any) {
        
        guard let phone = phoneTxtField.text , !phone.isEmpty,  let password = passwordTxtField.text , !password.isEmpty else{
            self.showAlert(title: "Error".localize, messages: nil, message: "Please Enter empty fields".localize, selfDismissing: false)
            return
        }
        if (phone.isPhoneNumberValid) {
            
        API.GetData(AllLoginResponseData.self,language: self.getCurrentDeviceLanguage(), url: URLS.login, method: .post, parameters : ["username" : phone,"password" : password], userToken: nil) {[weak self] (result) in
                    guard let self = self else {return}
            print(result)
            switch result {
                    case .success(let model):
                       // print("model = \(model)")
                        if model.status_message == nil{

                            let userName = model.data?.name
                            let userEmail = model.data?.email
                            let userId = model.data?.id
                            let userPhone = model.data?.phone
                            let userVerfied = model.data?.verified
                            let userToken = model.token
////                            let logoImage = model.data?.logo
////                            let userLat = model.data?.latitude
////                            let userLong = model.data?.longitude
//01224929187
                            UserDefaultData.save_user_data(token: userToken, id: userId, name: userName, email: userEmail, phone: userPhone, is_active: userVerfied)
                            
                            //go to next view controller
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "goKitchenVC") as! HomeKitchenViewController
                            self.present(nextViewController, animated: true, completion: nil)

                        }else{
                            self.showAlert(title: "Error11".localize, messages: nil, message:" status msg is \(model.status_message!)", selfDismissing: false)
                        }
                        break
                    case .failure(let err):
                        print(err!.localizedDescription)
                    case .noConnection(let Message):
                        self.showAlert(title: "Error".localize, messages: nil, message: Message, selfDismissing: false)
                    }
                }
        }else{
            showAlert(title: "error", messages: nil, message: "please enter the correct phone", selfDismissing: false)
        }
    }
    
    @IBAction func showPasswordButton(_ sender: UIButton) {
        let showImage = UIImage(named: "active_eye")
        let unShowImage = UIImage(named: "b-preview-outline-24")
        
        if passwordTxtField.isSecureTextEntry == true{
            passwordTxtField.isSecureTextEntry = false
            showPassOutlet.setImage(showImage, for: .normal)
        }else if passwordTxtField.isSecureTextEntry == false{
            passwordTxtField.isSecureTextEntry = true
            showPassOutlet.setImage(unShowImage, for: .normal)
            
        }
    }
    
    func Localize(){
        phoneTxtField.placeholder = "+974 000 000 00".localize
        passwordTxtField.placeholder = "password".localize
        signUpOutlet.setTitle("Sign In", for: .normal)
        forgetPassOutlet.setTitle("Forget Your Password?", for: .normal)
        signUpOutlet.setTitle("Sign Up", for: .normal)
        dontHaveAccLabel.text = "Don't Have Account?".localize
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
   performSegue(withIdentifier: "signUp", sender: self)
        
    }
    
}



// check validation
extension String {
    var isPhoneNumberValid : Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches( in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                
                return false
            }
        } catch {
            
            return false
        }
    }
    
}






