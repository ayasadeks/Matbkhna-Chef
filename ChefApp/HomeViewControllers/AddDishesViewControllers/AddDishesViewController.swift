//
//  MenuViewController.swift
//  ChefApp
//
//  Created by Admin on 9/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AddDishesViewController: UIViewController {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodNameTxtField: UITextField!
    @IBOutlet weak var ingredientsTxtField: UITextField!
    @IBOutlet weak var priceTxtField: UITextField!
    @IBOutlet weak var nextOutlet: ButtonCornerRadious!
    let userToke = UserDefaultData.get_user_string_data(key: "userToken")
    var dishArray = [DishDataArray]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

        guard let dishName = foodNameTxtField.text , !dishName.isEmpty,  let dishIngredients = ingredientsTxtField.text , !dishIngredients.isEmpty , let dishPrice = priceTxtField.text , !dishPrice.isEmpty else{
            self.showAlert(title: "Error".localize, messages: nil, message: "Please Enter All Requested Data".localize, selfDismissing: false)
            return
        }
        API.SetDish(title: dishName, titleEng: dishName, description: dishIngredients, descriptionEng: dishIngredients, smallPrice: dishPrice, mediumPrice: dishPrice, largePrice: dishPrice) { (sucess , id) in
            if sucess!{
                print("dish added sucessufully")

            }else{
                self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
            }
    }
       
}
    
    @IBAction func priceButton(_ sender: Any) {
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pricePopUp") as! PricePopUpViewController
        
        self.addChild(popvc)
        
        popvc.view.frame = self.view.frame
        
        self.view.addSubview(popvc.view)
        
        popvc.didMove(toParent: self)
        print("go price")
        
    }
    @IBAction func categoryButton(_ sender: Any) {
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addCategoryPopUp") as! AddCategoryPopUpViewController
        
        self.addChild(popvc)
        
        popvc.view.frame = self.view.frame
        
        self.view.addSubview(popvc.view)
        
        popvc.didMove(toParent: self)
        print("go category")
        
    }
    
}
