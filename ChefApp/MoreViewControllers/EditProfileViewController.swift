//
//  EditProfileViewController.swift
//  ChefApp
//
//  Created by Admin on 9/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    @IBOutlet weak var viewShadow: ViewCornerRadious!
    @IBOutlet weak var saveChangesOutlet: ButtonCornerRadious!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        saveChangesOutlet.layer.applySketchShadow(color: .black, alpha: 0.12, x: 0, y: 5, blur: 4, spread: 0)
       // profileImage.dropShadow(color: .lightGray, alpha: 0.5, x: 0, y: 5, blur: 10, spread: 0)
        viewShadow.dropShadow(color: .lightGray, alpha: 0.8, x: 0, y: 10, blur: 30, spread: 0)
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    @IBAction func doneButton(_ sender: Any) {
    }
    
    @IBAction func saveChangesButton(_ sender: Any) {
    }
    
}
