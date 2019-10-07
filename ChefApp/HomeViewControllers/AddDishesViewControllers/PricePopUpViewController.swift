//
//  PricePopUpViewController.swift
//  ChefApp
//
//  Created by Admin on 9/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class PricePopUpViewController: AddDishesViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var checkedImage1: UIImageView!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var checkedImage2: UIImageView!
    
    @IBOutlet weak var smallTxtField: UITextField!
    
    @IBOutlet weak var mediunTxtField: UITextField!
    @IBOutlet weak var largeTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkedImage1.image = UIImage(named: "outline")
        checkedImage2.image = UIImage(named: "outline")

        // Do any additional setup after loading the view.
    }
   
    @IBAction func actionButtons(_ sender: UIButton) {
        if sender.tag == 1 {
            checkedImage1.image = UIImage(named: "file")
            checkedImage2.image = UIImage(named: "outline")
        }else  {
            checkedImage2.image = UIImage(named: "file")
            checkedImage1.image = UIImage(named: "outline")


        }
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        print("close")
        dismiss(animated: true, completion: nil)
     
        //go to next view controller
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "goMenu") as! AddDishesViewController
        self.present(nextViewController, animated: true, completion: nil)
        
    }
    

}
