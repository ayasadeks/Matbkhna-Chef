//
//  InformationViewController.swift
//  ChefApp
//
//  Created by Admin on 9/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class KitchenInformationViewController: UIViewController {
    
    
    @IBOutlet weak var saveAndnextOutlet: ButtonCornerRadious!
    @IBOutlet weak var kitchenImage: CircleImageView!
    
    @IBOutlet weak var foodNameTxtField: UITextField!
    
    @IBOutlet weak var categoryTxtField: UITextField!
    @IBOutlet weak var aboutTxtField: UITextField!
    
    @IBOutlet weak var timeTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    // saveAndnextOutlet.layer.applySketchShadow(color: .black, alpha: 0.06, x: 0, y: 5, blur: 4, spread: 0) 
       // kitchenImage.layer.applySketchShadow(color: .init(red: 200, green: 201, blue: 202, alpha: 0.5), alpha: 0.5, x: 0, y: 10, blur: 15, spread: 0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func categoryButton(_ sender: Any) {
        //go to next view controller
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addCategoryPopUp") as! AddCategoryPopUpViewController
        
        self.addChild(popvc)
        
        popvc.view.frame = self.view.frame
        
        self.view.addSubview(popvc.view)
        
        popvc.didMove(toParent: self)
        
    }
    
    let height: CGFloat = 350

    @IBAction func timeButton(_ sender: Any) {
        print("ay haga")
        
        //go to next view controller
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "setWorkingTimeVC") as! setWorkingTimeViewController
        
        self.addChild(popvc)
        
        popvc.view.frame = self.view.frame
        
        self.view.addSubview(popvc.view)
        
        popvc.didMove(toParent: self)
    }
    
    @IBAction func saveAndNextButton(_ sender: Any) {
        

    }
   
}
