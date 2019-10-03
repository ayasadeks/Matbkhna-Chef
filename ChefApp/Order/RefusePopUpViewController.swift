//
//  RefusePopUpViewController.swift
//  ChefApp
//
//  Created by Admin on 9/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class RefusePopUpViewController: UIViewController {

    @IBOutlet weak var yesOutlet: ButtonCornerRadious!
    override func viewDidLoad() {
        super.viewDidLoad()

       yesOutlet.layer.applySketchShadow(color: .black, alpha: 0.06, x: 0, y: 5, blur: 4, spread: 0)
    }
    
    @IBAction func NoButton(_ sender: Any) {
    }
    
    @IBAction func noButton(_ sender: Any) {
    }
    

}
