//
//  VerifyPhoneNumViewController.swift
//  ChefApp
//
//  Created by Admin on 9/17/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import MOLH

class SendPhoneNumViewController: UIViewController {

    let userToke = UserDefaultData.get_user_string_data(key: "userToken")
    var code = String()

    @IBOutlet weak var phoneTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   
    @IBAction func confirmButton(_ sender: Any) {
        
       //  send phone to get the code
        API.GetData(AllSendVerficationCode.self, language: self.getCurrentDeviceLanguage(), url: URLS.sendVerficationCode, method: .post, parameters: ["verify_token": phoneTxtField.text], userToken: userToke) {[weak self] (result) in
            guard let self = self else {return}

            switch result {
            case .success(let model):
                if model.status_code == 200{
                
                self.showAlert(title: "the code", messages: nil, message: "code is \(self.code)", selfDismissing: true)
                print(self.code)

                    print("model\(model)")}
                break
            case .failure(let err):
                print(err!.localizedDescription)
            case .noConnection(let Message):
                self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
            }
        }
    }
    
}
