//
//  AddCategoryPopUpViewController.swift
//  ChefApp
//
//  Created by Admin on 9/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AddCategoryPopUpViewController: KitchenInformationViewController {

    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButton(_ sender: Any) {
        print("close")
        dismiss(animated: true, completion: nil)
            //go to next view controller
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "goInformation") as! KitchenInformationViewController
            self.present(nextViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func savecontinueButton(_ sender: Any) {
    }
    
    @IBAction func categoryActionsBtns(_ sender: UIButton ) {
        if sender.tag == 0 {
            firstImage.image = UIImage(named: "success_active")
            secondImage.image = UIImage(named: "success")
            thirdImage.image = UIImage(named: "success")
            print("first btn")

        }else if sender.tag == 1  {
            secondImage.image = UIImage(named: "success_active")
            firstImage.image = UIImage(named: "success")
            thirdImage.image = UIImage(named: "success")
            print("second btn")

            
        }else if sender.tag == 2 {
            thirdImage.image = UIImage(named: "success_active")
            firstImage.image = UIImage(named: "success")
            secondImage.image = UIImage(named: "success")
            print("third btn")
        }
    }
    
    
}
