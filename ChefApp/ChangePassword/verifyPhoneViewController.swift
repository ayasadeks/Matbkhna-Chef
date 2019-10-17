//
//  verifyPhoneViewController.swift
//  ChefApp
//
//  Created by Admin on 9/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class verifyPhoneViewController: UIViewController {
    let userToke = UserDefaultData.get_user_string_data(key: "userToken")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBOutlet weak var phoneTxtField: UITextField!
    
    @IBAction func nextButton(_ sender: Any) {
        guard let phone = phoneTxtField.text , !phone.isEmpty else{
            self.showAlert(title: "Error".localize, messages: nil, message: "Please Enter empty field".localize, selfDismissing: false)
            return
        }
        if (phone.isPhoneNumberValid) {

        //  send phone to get the code
        API.GetData(ForgotPassword.self, language: self.getCurrentDeviceLanguage(), url: URLS.forgetPassword, method: .post, parameters: ["phone": phone], userToken: userToke) {[weak self] (result) in
            guard let self = self else {return}
            
            switch result {
            case .success(let model):
                print("ssssssss")
                print(result)
                if model.status_code == 200{
                    print("model\(model)")
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "changePassword") as! ChangePasswordViewController
                    self.present(nextViewController, animated: false, completion: nil)
                    self.showAlert(title: "DONE", messages: nil, message: "go change password", selfDismissing: true)
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
}
