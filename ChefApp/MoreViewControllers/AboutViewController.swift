//
//  AboutViewController.swift
//  ChefApp
//
//  Created by Admin on 9/27/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        //go to next view controller
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "moreVC") as! MoreMenuViewController
        self.present(nextViewController, animated: true, completion: nil)
        
    }
    

}
