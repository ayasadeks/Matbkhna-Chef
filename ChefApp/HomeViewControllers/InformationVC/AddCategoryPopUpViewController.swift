//
//  AddCategoryPopUpViewController.swift
//  ChefApp
//
//  Created by Admin on 9/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AddCategoryPopUpViewController: InformationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true) {
            //go to next view controller
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "goMenu") as! AddDishesViewController
            self.present(nextViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func savecontinueButton(_ sender: Any) {
    }
    
}
