//
//  SignUpViewController.swift
//  ChefApp
//
//  Created by Admin on 9/16/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import Alamofire
import CodableAlamofire

class SignUpViewController: UIViewController, sendCountryId {

    var countryId = Int()
    var countryName = String()
    var delegate : sendCountryId?
    var isLoading : Bool = false

    
    func sendCountryId_Name(CountryId: Int, CountryName: String) {
        countryId = CountryId
        countryName = CountryName
        areaTxtField.text = CountryName
        print("categryIdd\(countryId)")
        self.isLoading = false
        viewDidLoad()
    }

    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var numberTxtField: UITextField!
    @IBOutlet weak var confirmPassTxtfield: UITextField!
    @IBOutlet weak var showBtn0: UIButton!
    @IBOutlet weak var shoBtn1: UIButton!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var nextOutlet: UIButton!
    @IBOutlet weak var areaTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //localize()
        self.areaTxtField.text = countryName
        nextOutlet.layer.applySketchShadow(color: .black, alpha: 0.06, x: 0, y: 5, blur: 4, spread: 0)
    }

    @IBAction func showPassword(_ sender: UIButton) {
        let showImage = UIImage(named: "active_eye")
        let unShowImage = UIImage(named: "b-preview-outline-24")
        
        if sender.tag == 0{
            if passwordTxtField.isSecureTextEntry == true{
                passwordTxtField.isSecureTextEntry = false
                showBtn0.setImage(showImage, for: .normal)
            }else if passwordTxtField.isSecureTextEntry == false{
                passwordTxtField.isSecureTextEntry = true
                showBtn0.setImage(unShowImage, for: .normal)
            }
        }else if sender.tag == 1{
            if confirmPassTxtfield.isSecureTextEntry == true{
                confirmPassTxtfield.isSecureTextEntry = false
                shoBtn1.setImage(showImage, for: .normal)
            }else if confirmPassTxtfield.isSecureTextEntry == false{
                confirmPassTxtfield.isSecureTextEntry = true
                shoBtn1.setImage(unShowImage, for: .normal)
            }
        }
    }
    //email validation
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    //password validation
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    @IBAction func nextButton(_ sender: Any) {
       
    
        
       
        guard let name = nameTxtField.text , !name.isEmpty, let email = emailTxtField.text , !email.isEmpty , let phone = numberTxtField.text, !phone.isEmpty , let area = areaTxtField.text , !area.isEmpty, let password = passwordTxtField.text, !password.isEmpty , let confirmPassword = confirmPassTxtfield.text , !confirmPassword.isEmpty else{

            self.showAlert(title: "Error".localize, messages: nil, message: "Enter All Empty  Data".localize, selfDismissing: false)
            return
        }
    
        let emailTest = isValidEmail(testStr: email)

                if  confirmPassword != password{
                self.showAlert(title: "Error".localize, messages: nil, message: "enter the same password".localize, selfDismissing: false)
            }else if emailTest == false{
                self.showAlert(title: "Error".localize, messages: nil, message: "enter valied email".localize, selfDismissing: false)
            }else{
               
                API.GetData(AllRegisterResponseData.self,language: self.getCurrentDeviceLanguage(), url: URLS.register, method: .post, parameters : ["name" : name,"password" : password, "email" : email, "phone" : phone, "user_type" : 1 ], userToken: nil) {[weak self] (result) in
                    guard let self = self else {return}
                    print(result)
                    switch result {
                    case .success(let model):
                        print("model = \(model)")
                        if model.status_message == nil{
                            
                            let userName = model.data?.name
                            let userEmail = model.data?.email
                            let userId = model.data?.id
                            let userPhone = model.data?.phone
                            let userVerfied = model.data?.verified
                            let userToken = model.token
                            ////        let logoImage = model.data?.logo
                            ////        let userLat = model.data?.latitude
                            ////        let userLong = model.data?.longitude
                            UserDefaultData.save_user_data(token: userToken, id: userId, name: userName, email: userEmail, phone: userPhone, is_active: userVerfied)
                            //go to next view
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "verfication") as! SendVerficationCodeViewController
                            self.present(nextViewController, animated: false, completion: nil)
                            
                         
                            
                            

                        }else{
                            self.showAlert(title: "Error11".localize, messages: nil, message: model.status_message!, selfDismissing: false)
                        }
                        break
                    case .failure(let err):
                        print(err!.localizedDescription)
                    case .noConnection(let Message):
                        self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
                }
            }
       }
   }
    
    @IBAction func selectAreaButton(_ sender: UIButton) {

        print("Select Area")
 
//        //go to next view controller
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "selectArea") as! SelectAreaViewController
        popvc.delegate = self

        self.addChild(popvc)

        popvc.view.frame = self.view.frame

        self.view.addSubview(popvc.view)

        popvc.didMove(toParent: self)

    }
}

   

