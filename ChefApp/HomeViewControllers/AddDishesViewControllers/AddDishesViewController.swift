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
    var dishArray = [DishDataArray]()
    var dishImage = UIImage()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOfImage.layer.applySketchShadow(color: .black, alpha: 0.14, x: 0, y: 10, blur: 15, spread: 0)
        nextOutlet.layer.applySketchShadow(color: .black, alpha: 0.06, x: 0, y: 5, blur: 4, spread: 0)
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
        let smallPrice : Int? = Int(smallPricTxtFielde.text!)
        let mediumPrice : Int? = Int(mediumPriceTxtField.text!)
        let largePrice : Int? = Int(largePriceTxtField.text!)
        guard let api_token = UserDefaultData.get_user_string_data(key: "userToken")  else{return}
     //   let api_token =  "UzJMtttbYhAbfsD4GbChQjtf4KgYQPTPCSUKESBGgcGCQnCQ0zS5PTU6oQSwlmZDSoso9EBmNa5cklmAwIn5i8X9Ftw1Hnk9UuQsS1pGAU8wZWs7dPA3IsGFx4KTZNlSyKNN0AouUzruj2QTMFA73H"
        guard let dishName = foodNameTxtField.text , !dishName.isEmpty,  let dishIngredients = ingredientsTxtField.text , !dishIngredients.isEmpty  else{
            self.showAlert(title: "Error".localize, messages: nil, message: "Please Enter All Required Data".localize, selfDismissing: false)
            return
        }
        if smallPricTxtFielde.text!.isEmpty == true{
            smallPricTxtFielde.text = nil
        }
        if mediumPriceTxtField.text!.isEmpty == true{
            mediumPriceTxtField.text = nil
        }
        if largePriceTxtField.text!.isEmpty == true{
            largePriceTxtField.text = nil
        }
   API.SetDish(title: dishName, titleEng: dishName, description: dishIngredients, descriptionEng: dishIngredients, smallPrice: smallPrice, mediumPrice: mediumPrice, largePrice: largePrice) { (sucess , id) in
            if sucess!{
            print("dish added sucess")

//                API.AddDishPhoto(dishImage: self.dishImage, dishId: id!, completion: { (sucess) in
//                    if sucess!{
//                        self.showToast(message: "Dish Added Sucessufly".localize)
//                    }else{
//                        self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
//                    }
//                })
            }else{
                self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
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





