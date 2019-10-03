//
//  ChangePasswordViewController.swift
//  ChefApp
//
//  Created by Admin on 9/17/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTxtField: UITextField!
    let userToke = UserDefaultData.get_user_string_data(key: "userToken")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func changePasswordButton(_ sender: ButtonCornerRadious) {
        
        
        API.GetData(AllChangePasswordResponseData.self,language: self.getCurrentDeviceLanguage(), url: URLS.changePassword, method: .post, parameters : ["oldPassword" : passwordTextField.text!,"newPassword" : confirmPasswordTxtField.text!, "api_token" : userToke! ], userToken: userToke) {[weak self] (result) in
            guard let self = self else {return}
            print(result)
            switch result {
            case .success(let model):
                print("model = \(model)")
                if model.status_code == 200 {
                    print("donnnne")
//                    let userName = model.data?.name
//                    let userEmail = model.data?.email
//                    let userId = model.data?.id
//                    let userPhone = model.data?.phone
//                    let userVerfied = model.data?.verified
//                   // let userToken = model.da
//                    ////                            let logoImage = model.data?.logo
//                    ////                            let userLat = model.data?.latitude
//                    ////                            let userLong = model.data?.longitude
//                    //
//                    UserDefaultData.save_user_data(token: userToken, id: userId, name: userName, email: userEmail, phone: userPhone, is_active: userVerfied)
                    
                    
                    //go to next view controller
                    let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "changePassPopUp") as! changePassPopUpViewController
                    
                    self.addChild(popvc)
                    
                    popvc.view.frame = self.view.frame
                    
                    self.view.addSubview(popvc.view)
                    
                    popvc.didMove(toParent: self)
                    
                 
                    
                }else{
                    self.showAlert(title: "Error11".localize, messages: nil, message: "change done", selfDismissing: false)
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
