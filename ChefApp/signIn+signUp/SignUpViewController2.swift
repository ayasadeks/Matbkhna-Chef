//
//  SignUpViewController2.swift
//  ChefApp
//
//  Created by Admin on 9/17/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SignUpViewController2: UIViewController {
    
    @IBOutlet weak var kitchenNameTxtField: UITextField!
    
    @IBOutlet weak var phoneTxtField: UITextField!
    
    @IBOutlet weak var constantLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassTxtFeild: UITextField!
    
    @IBOutlet weak var showPasswordOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showPasswordButton(_ sender: UIButton) {
        
        let showImage = UIImage(named: "active_eye")
        let unShowImage = UIImage(named: "b-preview-outline-24")
        
        if sender.tag == 0{
            if passwordTextField.isSecureTextEntry == true{
                passwordTextField.isSecureTextEntry = false
                showPasswordOutlet.setImage(showImage, for: .normal)
            }else if passwordTextField.isSecureTextEntry == false{
                passwordTextField.isSecureTextEntry = true
                showPasswordOutlet.setImage(unShowImage, for: .normal)
            }
        }else if sender.tag == 1{
            if confirmPassTxtFeild.isSecureTextEntry == true{
                confirmPassTxtFeild.isSecureTextEntry = false
                showPasswordOutlet.setImage(showImage, for: .normal)
            }else if confirmPassTxtFeild.isSecureTextEntry == false{
                confirmPassTxtFeild.isSecureTextEntry = true
                showPasswordOutlet.setImage(unShowImage, for: .normal)
            }
        }
    }
    
    func localize(){
        kitchenNameTxtField.placeholder = "Matbkhna".localize
        phoneTxtField.placeholder = "0000000 ".localize
        constantLabel.text = "+974".localize
        passwordTextField.placeholder = "password".localize
        confirmPassTxtFeild.placeholder = "confirm password".localize
        
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        
        guard let kitchenName = kitchenNameTxtField.text , !kitchenName.isEmpty, let phone = phoneTxtField.text , !phone.isEmpty , let password = passwordTextField.text, !password.isEmpty , let confirmPassword = confirmPassTxtFeild.text , !confirmPassword.isEmpty else{
            self.showAlert(title: "Error".localize, messages: [], message: "Enter All Form Data".localize, selfDismissing: true)
            return
        }
        
        if confirmPassword != password{
            self.showAlert(title: "Error".localize, messages: nil, message: "enter the same password".localize, selfDismissing: false)
        }else{
//
//            API.GetData(AllRegisterResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.register, method: .post, parameters: ["kitchenName": kitchenName,"phone" : phone,"password" : password,"user_type" : "0","confirmPassword" : confirmPassword ], userToken: nil) {[weak self] (result) in
//                guard let self = self else {return}
//                switch result {
//                case .success(let model):
//                    print("model = \(model)")
//                    if model.errors == nil{
//
//                        let userName = model.data?.name
//                        let userEmail = model.data?.email
//                        let userId = model.data?.id
//                        let userPhone = model.data?.phone
//                        let userVerfied = model.data?.verified
//                        let userToken = model.token
//                        let logoImage = model.data?.logo
//                        let userLat = model.data?.latitude
//                        let userLong = model.data?.longitude
//
//                        UserDefaultData.save_user_data(token: userToken, id: userId, name: userName, email: userEmail, phone: userPhone, is_active: userVerfied, image: logoImage, lat: userLat, long: userLong)
//                    }else{
//                        if model.errors?.phone != nil{
//                            self.showAlert(title: "Error".localize, messages: nil, message: model.errors?.phone![0], selfDismissing: false)
//
//                        }else if model.errors?.email != nil{
//                            self.showAlert(title: "Error".localize, messages: nil, message: model.errors?.email![0], selfDismissing: false)
//
//                        }
//
//                    }
//                    break
//                case .failure(let err):
//                    print(err!.localizedDescription)
//                case .noConnection(let Message):
//                    self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
//                }
//            }
//        }
//
        
        
    }
    }
   

}




//
//API.GetData(AllRegisterResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.register, method: .post, parameters: ["name": name,"email" : email,"user_type" : "0","area" : area, "password" : password], userToken: nil) {[weak self] (result) in
//    guard let self = self else {return}
//    switch result {
//    case .success(let model):
//        print("model = \(model)")
//        if model.errors == nil{
//            
//            let userName = model.data?.name
//            let userEmail = model.data?.email
//            let userId = model.data?.id
//            let userPhone = model.data?.phone
//            let userVerfied = model.data?.verified
//            let userToken = model.token
//            let logoImage = model.data?.logo
//            let userLat = model.data?.latitude
//            let userLong = model.data?.longitude
//            
//            UserDefaultData.save_user_data(token: userToken, id: userId, name: userName, email: userEmail, phone: userPhone, is_active: userVerfied, image: logoImage, lat: userLat, long: userLong, password: password)
//        }else{
//            if model.errors?.phone != nil{
//                self.showAlert(title: "Error".localize, messages: nil, message: model.errors?.phone![0], selfDismissing: false)
//                
//            }else if model.errors?.email != nil{
//                self.showAlert(title: "Error".localize, messages: nil, message: model.errors?.email![0], selfDismissing: false)
//                
//            }
//            
//        }
//        break
//    case .failure(let err):
//        print(err!.localizedDescription)
//    case .noConnection(let Message):
//        self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
//    }
//}
//}
//        
