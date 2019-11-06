//
//  NewPasswordViewController.swift
//  ChefApp
//
//  Created by Admin on 11/6/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class NewPasswordViewController: UIViewController {
    @IBOutlet weak var oldPasswodTxtField: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var newPasswordTxtField: UITextField!
    let apiToken = UserDefaultData.get_user_string_data(key: "userToken")

    @IBOutlet weak var showBtn0: UIButton!
    @IBOutlet weak var showBtn1: UIButton!
    @IBOutlet weak var showBtn2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    @IBAction func changePasswordButton(_ sender: ButtonCornerRadious) {
        
        
        guard let oldPassword = oldPasswodTxtField.text , !oldPassword.isEmpty,  let newPassword = newPasswordTxtField.text , !newPassword.isEmpty, let confirmPassword = confirmPassword.text , !confirmPassword.isEmpty else{
            self.showAlert(title: "Error".localize, messages: nil, message: "Please Enter empty fields".localize, selfDismissing: false)
            return
        }
         let parameters : [String : Any] = ["oldPassword" : oldPassword, "newPassword" : newPassword, "api_token" : apiToken]
         if  confirmPassword != newPassword{
            self.showAlert(title: "Error".localize, messages: nil, message: "enter the same password".localize, selfDismissing: false)
         }else {
        API.GetData(AllUpdatePassResponseData.self,language: self.getCurrentDeviceLanguage(), url: URLS.updatePassword, method: .post, parameters: parameters , userToken: apiToken) {[weak self] (result) in
            guard let self = self else {return}
            print(result)
            switch result {
            case .success(let model):
                print("model = \(model)")
                if model.status_code == 200 {
                    print("donnnne")
                    let userName = model.data?.name
                    let userEmail = model.data?.email
                    let userId = model.data?.id
                    let userPhone = model.data?.phone
                    let userVerfied = model.data?.verified
                    UserDefaultData.save_user_data(token: self.apiToken, id: userId, name: userName, email: userEmail, phone: userPhone, is_active: userVerfied)
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "settings") as! SettingsViewController
                    self.present(nextViewController, animated:false, completion:nil)
                    
                    
                }else{
                    self.showAlert(title: "Error11".localize, messages: nil, message: model.status_message, selfDismissing: false)
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
        
        
        
    
    @IBAction func showPasswordBtnAction(_ sender: UIButton) {
        let showImage = UIImage(named: "active_eye")
        let unShowImage = UIImage(named: "b-preview-outline-24")
        
        if sender.tag == 0{
            if oldPasswodTxtField.isSecureTextEntry == true{
                oldPasswodTxtField.isSecureTextEntry = false
                showBtn0.setImage(showImage, for: .normal)
            }else if oldPasswodTxtField.isSecureTextEntry == false{
                oldPasswodTxtField.isSecureTextEntry = true
                showBtn0.setImage(unShowImage, for: .normal)
            }
        }else if sender.tag == 1{
            if newPasswordTxtField.isSecureTextEntry == true{
                newPasswordTxtField.isSecureTextEntry = false
                showBtn1.setImage(showImage, for: .normal)
            }else if newPasswordTxtField.isSecureTextEntry == false{
                newPasswordTxtField.isSecureTextEntry = true
                showBtn1.setImage(unShowImage, for: .normal)
            }
        }else if sender.tag == 2{
        if confirmPassword.isSecureTextEntry == true{
        confirmPassword.isSecureTextEntry = false
        showBtn1.setImage(showImage, for: .normal)
        }else if confirmPassword.isSecureTextEntry == false{
        confirmPassword.isSecureTextEntry = true
        showBtn1.setImage(unShowImage, for: .normal)
        }
    }
}
    
    
  

}
