//
//  InformationViewController.swift
//  ChefApp
//
//  Created by Admin on 9/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class KitchenInformationViewController: UIViewController, sentCategoryId {
    
    func setCategoryIdFunc(categoryID: Int) {
        categoryId = categoryID
        print("categryIdd\(categoryId)")
        self.isLoading = false
        viewDidLoad()
    }
    
    
    @IBOutlet weak var viewOfImage: UIView!
    @IBOutlet weak var saveAndnextOutlet: ButtonCornerRadious!
    @IBOutlet weak var kitchenImage: CircleImageView!
    @IBOutlet weak var foodNameTxtField: UITextField!
    @IBOutlet weak var categoryTxtField: UITextField!
    @IBOutlet weak var aboutTxtField: UITextField!
    @IBOutlet weak var timeTxtField: UITextField!
    
    var kitchenPhoto = UIImage()
    var delegate : sentCategoryId?
    var categoryId = -1
    var current_page = 1
    var last_page = 1
    var isLoading : Bool = false
    var imageBaseUrl = String()
    var searchKey = "nil"
    var LoadType = true

  
    override func viewDidLoad() {
        super.viewDidLoad()
//     saveAndnextOutlet.layer.applySketchShadow(color: .black, alpha: 0.06, x: 0, y: 5, blur: 4, spread: 0)
   // viewOfImage.layer.applySketchShadow(color: .black, alpha: 0.14, x: 0, y: 10, blur: 15, spread: 0)
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func categoryButton(_ sender: Any) {
 
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addCategoryPopUp") as! AddCategoryPopUpViewController
        popvc.delegate = self

        self.addChild(popvc)

        popvc.view.frame = self.view.frame

        self.view.addSubview(popvc.view)

        popvc.didMove(toParent: self)
        
    }
    
    let height: CGFloat = 350

    @IBAction func timeButton(_ sender: UIButton) {
        print("select working days")
        
        //go to next view controller
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "workingDays") as! SetWorkingDaysViewController
        
        self.addChild(popvc)
        
        popvc.view.frame = self.view.frame
        
        self.view.addSubview(popvc.view)
        
        popvc.didMove(toParent: self)
    }
    
    @IBAction func saveAndNextButton(_ sender: Any) {
        

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
