//
//  MenuViewController.swift
//  ChefApp
//
//  Created by Admin on 9/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AddDishesViewController: UIViewController {

    @IBOutlet weak var viewOfImage: UIView!
    @IBOutlet weak var dishPhoto: CircleImageView!
    @IBOutlet weak var foodNameTxtField: UITextField!
    @IBOutlet weak var ingredientsTxtField: UITextField!
    @IBOutlet weak var smallPricTxtFielde: UITextField!
    @IBOutlet weak var mediumPriceTxtField: UITextField!
    @IBOutlet weak var largePriceTxtField: UITextField!
    @IBOutlet weak var nextOutlet: ButtonCornerRadious!
    let userToke = UserDefaultData.get_user_string_data(key: "userToken")
    var dishArray = [DishDataArray]()
    var dishImage = UIImage()
     let api_token = UserDefaultData.get_user_string_data(key: "userToken")


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  viewOfImage.layer.applySketchShadow(color: .black, alpha: 0.14, x: 0, y: 10, blur: 15, spread: 0)

    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func extraItemsButton(_ sender: ButtonCornerRadious) {
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "extraItemsPopUp") as! ExtraItemsPopUpViewController

        self.addChild(popvc)

        popvc.view.frame = self.view.frame

        self.view.addSubview(popvc.view)

        popvc.didMove(toParent: self)
        
    }
    @IBAction func saveButton(_ sender: ButtonCornerRadious) {
        var smallPrice = smallPricTxtFielde.text
        var mediumPrice = mediumPriceTxtField.text
        var largePrice = largePriceTxtField.text

        guard let dishName = foodNameTxtField.text , !dishName.isEmpty,  let dishIngredients = ingredientsTxtField.text , !dishIngredients.isEmpty  else{
            self.showAlert(title: "Error".localize, messages: nil, message: "Please Enter All Required Data".localize, selfDismissing: false)
            return
        }
        if smallPrice?.isEmpty == true{
            smallPrice = nil
        }
        if mediumPrice?.isEmpty == true{
            mediumPrice = nil
        }
        if largePrice?.isEmpty == true{
            largePrice = nil
        }
        let parameters = [
            "title" : dishName,
            "titleEng" : dishName,
            "description" : dishIngredients,
            "descriptionEng" : dishIngredients,
            "api_token": api_token
        ]

        API.GetData(AllDishData.self,language: self.getCurrentDeviceLanguage(), url: URLS.addDish, method: .post, parameters : parameters as [String : Any] , userToken: nil) {[weak self] (result) in
            guard let self = self else {return}
            print(result)
            switch result {
            case .success(let model):
                if model.status_code == 200{
                    print("dish added sucess")
                     print("model = \(model)")
                    let dishId = model.data?[0].id
                        
                    API.AddDishPhoto(dishImage: self.dishImage, dishId: dishId!, completion: { (sucess) in
                        if sucess!{
                              self.showAlert(title: "Error".localize, messages: nil, message: "Dish Added sucess ".localize , selfDismissing: false)
                        }else{
                            self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection00".localize , selfDismissing: false)
                        }
                    })
                }else{
                    self.showAlert(title: "Error11".localize, messages: nil, message:" status message is \(model.status_message)", selfDismissing: false)
                }
                break
            case .failure(let err):
                print(err!.localizedDescription)
            case .noConnection(let Message):
                self.showAlert(title: "Error".localize, messages: nil, message: Message, selfDismissing: false)
          }
    }

    
}


    
    @IBAction func addPhotoButton(_ sender: Any) {
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
            dishImage = picker_image!
            self.dishPhoto.image = dishImage
        }
    }
    
    
    
}

extension AddDishesViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
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

