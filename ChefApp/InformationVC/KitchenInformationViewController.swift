//
//  InformationViewController.swift
//  ChefApp
//
//  Created by Admin on 9/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class KitchenInformationViewController: UIViewController, sendCategoryId {
    
    
    func setCategoryIdFunc(CategoryID: Int, CategotryName: String) {
        categoryId = CategoryID
        categoryName = CategotryName
        print("categryIdd\(categoryId)")
        categoryTxtField.text = CategotryName
        self.isLoading = false
        viewDidLoad()
    }
    
    var api_token = UserDefaultData.get_user_string_data(key: "userToken")
    var phone : String?
    
    @IBOutlet weak var viewOfImage: UIView!
    @IBOutlet weak var saveAndnextOutlet: ButtonCornerRadious!
    @IBOutlet weak var kitchenImage: CircleImageView!
    @IBOutlet weak var foodNameTxtField: UITextField!
    @IBOutlet weak var categoryTxtField: UITextField!
    @IBOutlet weak var aboutTxtField: UITextField!
    @IBOutlet weak var timeTxtField: UITextField!
    
    var kitchenPhoto = UIImage()
    var delegate : sendCategoryId?
    var categoryId = -1
    var categoryName : String?
    var current_page = 1
    var last_page = 1
    var isLoading : Bool = false
    var imageBaseUrl = String()
    var searchKey = String()
    var LoadType = true
  
    override func viewDidLoad() {
        super.viewDidLoad()

      saveAndnextOutlet.dropShadow(color: .black, alpha: 0.06, x: 0, y: 5, blur: 4, spread: 0)
        viewOfImage.dropShadow(color: .black, alpha: 0.14, x: 0, y: 10, blur: 15, spread: 0)

    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func categoryButton(_ sender: Any) {
        print("set category")
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addCategoryPopUp") as! AddCategoryPopUpViewController
        popvc.delegate = self as sendCategoryId
        self.categoryTxtField.text = categoryName

        self.addChild(popvc)

        popvc.view.frame = self.view.frame

        self.view.addSubview(popvc.view)

        popvc.didMove(toParent: self)
        
    }
    
    let height: CGFloat = 350

    @IBAction func timeButton(_ sender: UIButton) {
        print("select working days")
        
        //go to next view controller
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "setWorkingTimeVC") as! setWorkingTimeViewController
        
        self.addChild(popvc)
        
        popvc.view.frame = self.view.frame
        
        self.view.addSubview(popvc.view)
        
        popvc.didMove(toParent: self)
    }
    
    @IBAction func saveAndNextButton(_ sender: Any) {
        
        guard let name = foodNameTxtField.text , !name.isEmpty,  let category = categoryTxtField.text , !category.isEmpty, let about = aboutTxtField.text ,!about.isEmpty, let time = timeTxtField.text ,!time.isEmpty else{
            self.showAlert(title: "Error".localize, messages: nil, message: "Please Enter empty fields".localize, selfDismissing: false)
            return
        }
        API.GetData(AllUserUpdateResponseData.self,language: self.getCurrentDeviceLanguage(), url: URLS.userUpdate, method: .post, parameters : ["name" : name,"description" : about, "api_token" : api_token!, "phone" : phone!], userToken: nil) {[weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let model):
                print("model = \(model)")
                if model.status_message == nil{
                    
                    let userName = model.data?.name
                    let userEmail = model.data?.email
                    let userId = model.data?.id
                    let userPhone = model.data?.phone
                    let userVerfied = model.data?.verified
                    let userImage = model.data?.logo
                    let userLat = model.data?.latitude
                    let userLong = model.data?.longitude
                    UserDefaultData.save_user_update_data(token: self.api_token!, id: userId, name: userName, email: userEmail, phone: userPhone, is_active: userVerfied, image: userImage, lat: userLat, long: userLong)
                    
                }else{
                    self.showAlert(title: "Error".localize, messages: nil, message: model.status_message!, selfDismissing: false)
                }
                break
            case .failure(let err):
                print(err!.localizedDescription)
            case .noConnection(let Message):
                self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
            }
      }
}
    
    
    
    @IBAction func addKitchenImage(_ sender: UIButton) {
        imageHandel()
    }
    func imageHandel() {
        print("imageHandel is called")
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = self
        self.present(picker, animated: false, completion: nil)
    }
    var picker_image : UIImage?{
        didSet{
            kitchenPhoto = picker_image!
            self.kitchenImage.image = kitchenPhoto
        }
    }
   
}

extension KitchenInformationViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{

//Image Delegate
func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: false, completion: nil)
}

func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let editingImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
        
        self.picker_image = editingImage
    }else{
        if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            self.picker_image = originalImage
        }
    }
    picker.dismiss(animated: false, completion: nil)
    
}


}//end of extension
