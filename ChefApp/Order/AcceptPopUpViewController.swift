//
//  PopUpViewController.swift
//  ChefApp
//
//  Created by Admin on 9/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AcceptPopUpViewController: UIViewController {

    @IBOutlet weak var startOrderOutlet: ButtonCornerRadious!
    override func viewDidLoad() {
        super.viewDidLoad()
startOrderOutlet.layer.applySketchShadow(color: .black, alpha: 0.06, x: 0, y: 5, blur: 4, spread: 0)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func startOrderButton(_ sender: Any) {
    }
    

}
