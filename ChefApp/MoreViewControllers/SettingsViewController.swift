//
//  SettingsViewController.swift
//  ChefApp
//
//  Created by Admin on 9/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
         }
    @IBAction func backButton(_ sender: Any) {
        //go to next view controller
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "moreVC") as! MoreMenuViewController
        self.present(nextViewController, animated: true, completion: nil)
        
    }
    

   

}
