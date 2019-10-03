//
//  SendVerficationCodeViewController.swift
//  ChefApp
//
//  Created by Admin on 9/17/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import MOLH

class SendVerficationCodeViewController: UIViewController {

    @IBOutlet weak var shadowView: ViewCornerRadious!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField6: UITextField!
    @IBOutlet weak var textField7: UITextField!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    
    @IBOutlet var textFields : [UITextField]!
    
    @IBOutlet var viewUnderCode : [UIView]!
    
    @objc override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if self.getCurrentDeviceLanguage() == "en"{
            textField1.becomeFirstResponder()
        }else if self.getCurrentDeviceLanguage() == "ar"{
            textField7.becomeFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AskCode()
        print(self.code)
        shadowView.dropShadow(color: .black, alpha: 0.1, x: 0, y: 7, blur: 16, spread: 0)
        
        showAlert(title: "the code", messages: nil, message: "the code is \(code)", selfDismissing: false)
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
        
    }
    let userToke = UserDefaultData.get_user_string_data(key: "userToken")
    var code = ""
    var phone : String?


    @IBAction func resendButton(_ sender: UIButton) {
        AskCode()
    }
    func AskCode(){

        API.GetData(AllAskVerficationCode.self, language: self.getCurrentDeviceLanguage(), url: URLS.askVerficationCode, method: .post, parameters: ["api_token": userToke!], userToken: userToke) {[weak self] (result) in
            guard let self = self else {return}

            switch result {
            case .success(let model):
                print("model\(model)")
                break
            case .failure(let err):
                print(err!.localizedDescription)
            case .noConnection(let Message):
                self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
            }
        }
    }

}


extension SendVerficationCodeViewController{
    @objc func textDidChange(_ notification: Notification) {
        
        if self.getCurrentDeviceLanguage() == "en"{
            for textField in textFields {
                if textField == textField1 && textField.text!.count == 1{
                    textField2.becomeFirstResponder()
                }else if textField == textField2 && textField.text!.count == 1{
                    textField3.becomeFirstResponder()
                }else if textField == textField3 && textField.text!.count == 1{
                    textField4.becomeFirstResponder()
                }else if textField == textField4 && textField.text!.count == 1{
                    textField5.becomeFirstResponder()
                }else if textField == textField5 && textField.text!.count == 1{
                    textField6.becomeFirstResponder()
                }else if textField == textField6 && textField.text!.count == 1{
                    textField7.becomeFirstResponder()
                }else if textField == textField7 && textField.text!.count == 1{
                    textField7.resignFirstResponder()
                    
                    self.code = "\(self.textField1.text!)\(self.textField2.text!)\(self.textField3.text!)\(self.textField4.text!)\(self.textField5.text!)\(self.textField6.text!)"
                    
                    API.GetData(AllSendVerficationCode.self, language: self.getCurrentDeviceLanguage(), url: URLS.sendVerficationCode, method: .post, parameters: ["verify_token" : phone! ,"api_token": userToke!], userToken: userToke) {[weak self] (result) in
                        guard let self = self else {return}

                        switch result {
                        case .success(let model):
                           // print("model\(model)")
                            print("code success")
                            
                            let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "verficationPopUp") as! VerficationAlertViewController
                            
                            self.addChild(popvc)
                            
                            popvc.view.frame = self.view.frame
                            
                            self.view.addSubview(popvc.view)
                            
                            popvc.didMove(toParent: self)
                            
                            
                            break
                        case .failure(let err):
                            print(err!.localizedDescription)
                        case .noConnection(let Message):
                            self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
                        }
                    }
                    
                }
            }
        }else if self.getCurrentDeviceLanguage() == "ar"{
            for textField in textFields {
                //                print("textField\(textField)")
                if textField == textField7 && textField.text!.count == 1{
                    textField6.becomeFirstResponder()
                    break
                }else if textField == textField6 && textField.text!.count == 1{
                    print("FOTextFeild")
                    textField5.becomeFirstResponder()
                    break
                }else if textField == textField5 && textField.text!.count == 1{
                    
                    textField4.becomeFirstResponder()
                    
                    print("TTextFeild")
                    break
                    
                }else if textField == textField4 && textField.text!.count == 1{
                    print("STextFeild")
                    
                    textField3.becomeFirstResponder()
                    break
                }else if textField == textField3 && textField.text!.count == 1{
                    print("FTextFeild")
                    
                    textField2.becomeFirstResponder()
                    break
                }else if textField == textField2 && textField.text!.count == 1{
                    print("FTextFeild")
                    
                    textField1.becomeFirstResponder()
                    break
                }else if textField == textField1 && textField.text!.count == 1{
                    print("FTextFeild")
                    
                    textField1.resignFirstResponder()
                    self.code = "\(self.textField6.text!)\(self.textField5.text!)\(self.textField4.text!)\(self.textField3.text!)\(self.textField2.text!)\(self.textField1.text!)"
                    print("code\(code)")
                    API.GetData(AllSendVerficationCode.self, language: self.getCurrentDeviceLanguage(), url: URLS.sendVerficationCode, method: .post, parameters: ["verify_token" : code,"api_token": userToke!], userToken: userToke) {[weak self] (result) in
                        guard let self = self else {return}

                        switch result {
                        case .success(let model):
                            print("model\(model)")
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
}//end of textdidchange
}

