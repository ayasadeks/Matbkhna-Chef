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
    @IBOutlet weak var phoneTxtField: UITextField!
    
    @IBAction func nextButton(_ sender: Any) {
        
        //  send phone to get the code
        API.GetData(AllSendVerficationCode.self, language: self.getCurrentDeviceLanguage(), url: URLS.sendVerficationCode, method: .post, parameters: ["verify_token": phoneTxtField.text!, "api_token" : userToke!], userToken: userToke) {[weak self] (result) in
            guard let self = self else {return}
            
            switch result {
            case .success(let model):
                if model.status_code == 200{
                    print("model\(model)")

                    self.showAlert(title: "go change password", messages: nil, message: "donee ", selfDismissing: true)
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "sendPhoneToChangePass") as! ChangePasswordViewController
                    self.present(nextViewController, animated: true, completion: nil)
                    
                    
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
