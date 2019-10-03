//
//  RALogin.swift
//  Mtbkhna_Cooker
//
//  Created by Macbook on 5/13/19.
//  Copyright © 2019 Mobileaders. All rights reserved.
//

import UIKit

class RALogin: UIViewController {

    @IBOutlet weak var registerBtn: ButtonCornerRadious!
    @IBOutlet weak var forgetPasswordBtn: UIButton!
    @IBOutlet weak var loginBtn: ButtonCornerRadious!
    @IBOutlet weak var passwordTextFeild: FormTextFieldDesigen!
    @IBOutlet weak var phoneTextFeild: FormTextFieldDesigen!
    override func viewDidLoad() {
        super.viewDidLoad()
        Localize()

    }//end of viewDidLoad func
    func Localize(){
        phoneTextFeild.placeholder = "Enter Your Phone Or Email".localize
        passwordTextFeild.placeholder = "Enter Your Password".localize
        loginBtn.setTitle("Login", for: .normal)
        forgetPasswordBtn.setTitle("Forget Your Password?", for: .normal)
        registerBtn.setTitle("Register", for: .normal)

    }//end of Localize func
    @IBAction func loginBtnAction(_ sender: Any) {
        guard let phone = phoneTextFeild.text , !phone.isEmpty,  let password = passwordTextFeild.text , !password.isEmpty else{
            self.showAlert(title: "Error".localize, messages: nil, message: "Please Enter All Requested Data".localize, selfDismissing: false)
            return
        }
        API.Login(userphone: phone, password: password) { (success, Message) in
            if success && Message == "no error"{
                print("user login Successfuly")
            }else if success && Message != "no error"{
                self.showAlert(title: "Error".localize, messages: nil, message: "\(Message)", selfDismissing: false)
            }else{
                self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
            }
        }
    }//end of loginBtnAction
    
    @IBAction func registerBtnAction(_ sender: Any) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let registerVC =  self.storyboard!.instantiateViewController(withIdentifier: "registerVC") as! RARegister
        navigationController?.pushViewController(registerVC, animated: true)
    }//end of registerBtnAction
    @IBAction func forgetPasswordBtnAction(_ sender: Any) {
        
    }//end of forgetPasswordBtnAction
}//end of RALogin class
